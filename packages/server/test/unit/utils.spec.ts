// @ts-ignore
import * as Utils from '../../src/utils';

describe('utils', () => {
  const str = `
Database: test
Table Name: products
Assumptions:
- Top10 means the top 10 products with the highest buy_price.
Query:
\`\`\`
SELECT *
FROM \`products\`
ORDER BY \`buy_price\` DESC
LIMIT 10;
\`\`\`
`;

  it('extract sql', () => {
    expect(Utils.getQuerySql(str)).toBe(
      'SELECT *\nFROM `products`\nORDER BY `buy_price` DESC\nLIMIT 10;\n',
    );
  });

  it('extract table name', () => {
    expect(Utils.getTableName(str)).toBe('products');
    expect(
      Utils.getTableName(
        '"products" table contains the price information for each product.',
      ),
    ).toBe('products');
    expect(
      Utils.getTableName(
        'table named "products" contains the price information for each product.',
      ),
    ).toBe('products');
    expect(
      Utils.getTableName(
        'table named `products` contains the price information for each product.',
      ),
    ).toBe('products');
    expect(
      Utils.getTableName(
        'The product price is stored in the `buy_price` column of the `products` table.',
      ),
    ).toBe('products');
    expect(
      Utils.getTableName('The table name for products is `products`.'),
    ).toBe('products');
    expect(
      Utils.getTableName('The table `test.products` exists in the database.'),
    ).toBe('products');
  });
});
