const { ChatGoogle } = require('@langchain/google/node');

const model = new ChatGoogle({
  model: 'gemini-3.1-flash-lite',
  apiKey: process.env.GEMINI_API_KEY,
  includeThoughts: true
});

const modelWithSearch = new ChatGoogle({
  model: 'gemini-2.5-flash',
  apiKey: process.env.GEMINI_API_KEY,
}).bindTools([
  { googleSearchRetrieval: {} }
]);

module.exports = { model, modelWithSearch };