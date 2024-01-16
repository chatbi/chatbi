import crypto from 'crypto';

interface IAigcaasSignInput {
  secretId: string;
  secretKey: string;
}

export function sign(signInput: IAigcaasSignInput) {
  const timestamp = Math.round(Date.now() / 1000);
  const nonce = 10000 + Math.round(Math.random() * 90000);
  const hash = crypto.createHash('sha256');
  hash.update(`${timestamp}${signInput.secretKey}${nonce}`);
  const token = hash.digest('hex');

  const headers = {
    SecretID: signInput.secretId,
    Nonce: nonce,
    Token: token,
    Timestamp: timestamp,
    'Content-Type': 'application/json',
  };
  return headers;
}
