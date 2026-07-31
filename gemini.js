const { ChatGoogle } = require('@langchain/google/node');

const model = new ChatGoogle({
  model: 'gemini-3.1-flash-lite',
  apiKey: process.env.GEMINI_API_KEY,
  includeThoughts: true
});

module.exports = { model };