import { BaseLLM } from './llm.js';

export enum FieldDirect {
  Input = 'input',
  Output = 'output',
}

export enum FieldType {
  ListDict = 'list[dict]',
  Str = 'str',
  Int = 'int',
}

export class Field {
  direct: FieldDirect;
  type: FieldType;
  description: string;

  constructor(opts: { type: FieldType; description: string }) {
    this.type = opts.type;
    this.description = opts.description;
  }
}

export class InputField extends Field {
  readonly direct = FieldDirect.Input;
}

export class OutputField extends Field {
  readonly direct = FieldDirect.Output;
}

export class Signature {
  messages: InputField;
  reasoning: OutputField;
  answer: OutputField;
  reason: OutputField;

  constructor(opts: {
    messages: InputField;
    reasoning: OutputField;
    answer: OutputField;
    reason: OutputField;
  }) {
    this.messages = opts.messages;
    this.reasoning = opts.reasoning;
    this.answer = opts.answer;
    this.reason = opts.reason;
  }

  setInputField(field: InputField) {
    this.messages = field;
  }

  setOutputField(field: OutputField) {
    if (!this.reasoning) {
      this.reasoning = field;
    } else if (!this.answer) {
      this.answer = field;
    } else if (!this.reason) {
      this.reason = field;
    }
  }

  /**
   * Converts the signature to a prompt.
   * 
   * Example:
   *  Your input fields are:
      1. "messages" (list[dict])

      Your output fields are:
      1. "reasoning" (str)
      2. "answer" (str): The SQL query, do not use markdown.
      3. "reason" (str)
   */
  toPrompt() {
    return `Your input fields are:
1. "messages" (${this.messages.type}): ${this.messages.description}

Your output fields are:
1. "reasoning" (${this.reasoning.type}): ${this.reasoning.description}
2. "answer" (${this.answer.type}): ${this.answer.description}
3. "reason" (${this.reason.type}): ${this.reason.description}
    `;
  }
}

export class CotAgent {
  sig: Signature;
  ai: BaseLLM;

  constructor(sig: Signature, ai: BaseLLM) {
    this.sig = sig;
    this.ai = ai;
  }

  toPrompt(inputs: { messages: Chat.ChatgptMessage[] }) {
    const sigFieldsStr = Object.keys(this.sig)
      .map((key) => {
        return `
        [[ ## ${key} ## ]]
        {${key}}\n
        `;
      })
      .join('\n');

    const sigInputFieldsStr = Object.keys(this.sig)
      .filter((key) => this.sig[key].direct === FieldDirect.Input)
      .map((key) => {
        return `
        [[ ## ${key} ## ]]
${
  this.sig[key].type === FieldType.ListDict
    ? JSON.stringify(inputs[key])
    : inputs[key]
}\n
        `;
      })
      .join('\n');

    // join to string like "[[ ## reasoning ## ]]", then "[[ ## answer ## ]]", then "[[ ## reason ## ]]"
    const sigOutputFieldsStr = Object.keys(this.sig)
      .filter((key) => this.sig[key].direct === FieldDirect.Output)
      .map((key, index) => {
        return `${index > 0 ? ' then ' : ''} "[[ ## ${key} ## ]]"`;
      })
      .join(',');

    const instructions = `
${this.sig.toPrompt()}

All interactions will be structured in the following way, with the appropriate values filled in.

${sigFieldsStr}

[[ ## completed ## ]]

In adhering to this structure, your objective is: 
  Signature for the text2sql method.

${sigInputFieldsStr}
  `;

    // if (isResponseText) {
    //   instructions += `Respond with the corresponding output fields, starting with the field ${sigOutputFieldsStr}, and then ending with the marker for "[[ ## completed ## ]]"`;
    // }

    return instructions;
  }

  run(messages: Chat.ChatgptMessage[], useCache = true) {
    const prompt = this.toPrompt({
      messages,
    });

    // if (isResponseText) {
    //   return this.ai.generateText(prompt);
    // }

    return this.ai.generateObject(prompt, useCache);
  }

  /**
   * Parses the output field in signature from the message.
   * @param msg string in the format of: "[[ ## reasoning ## ]]\n为了找出销售额最高的5款产品，我们需要假设有一个表来记录销售数据。然而，在提供的表结构中，并没有直接提供关于销售金额或数量的信息。但是，基于常见的数据库设计，我们可以推测`orders`表可能与产品的销售相关，特别是如果它包含一个`product_id`字段指向`products`表中的产品。由于缺乏直接的销售金额信息，我们将使用订单的数量作为衡量标准，即哪个产品被订购的次数最多。这虽然不是准确的销售额（因为不同的产品可能有不同的价格），但在当前给定的数据模型下是最佳估计方法。\n\n[[ ## answer ## ]]\n```sql\nSELECT p.id, p.name, COUNT(o.id) AS sales_count\nFROM products p\nJOIN orders o ON p.id = o.product_id\nGROUP BY p.id, p.name\nORDER BY sales_count DESC\nLIMIT 5;\n```\n\n[[ ## reason ## ]]\n根据现有数据库表结构，我们通过关联`products`和`orders`表来计算每个产品的销售量（以订单数量为依据），从而确定销售额最高的前5款产品。这里假设每个订单代表一次销售，且所有订单对销售额的贡献均等。若实际业务逻辑中存在单价不同等情况，则需要额外的价格信息才能准确计算销售额。\n\n[[ ## completed ## ]]"
   */
  parseArgs(msg: string) {
    const args = msg.split('\n\n');
    const output = {
      reasoning: args[1].replace('[[ ## reasoning ## ]]', ''),
      answer: args[3].replace('[[ ## answer ## ]]', ''),
      reason: args[5].replace('[[ ## reason ## ]]', ''),
    };

    return output;
  }
}
