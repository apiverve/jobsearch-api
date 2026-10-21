/**
 * Basic Example - Job Search API
 *
 * This example demonstrates how to use the Job Search API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const jobsearchAPI = require('../index.js');

// Initialize the API client
const api = new jobsearchAPI({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
var query = {
  keyword: "software engineer",
  location: "New York",
  country: "US",
  remote: true,
  employmentType: "full-time",
  postedSince: "7d",
  company: "airbnb",
  minSalary: 100000,
  page: 1
};

// Make the API request using callback
console.log('Making request to Job Search API...\n');

api.execute(query, function (error, data) {
    if (error) {
        console.error('Error occurred:');
        if (error.error) {
            console.error('Message:', error.error);
            console.error('Status:', error.status);
        } else {
            console.error(JSON.stringify(error, null, 2));
        }
        return;
    }

    console.log('Response:');
    console.log(JSON.stringify(data, null, 2));
});
