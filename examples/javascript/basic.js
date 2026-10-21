/**
 * Job Search API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Job Search API.
 * API Documentation: https://docs.apiverve.com/ref/jobsearch
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/jobsearch';

/**
 * Make a GET request to the Job Search API
 */
async function callJobSearchAPI() {
  try {
    // Query parameters
    const params &#x3D; new URLSearchParams({
            keyword: &#x27;software engineer&#x27;,
            location: &#x27;New York&#x27;,
            country: &#x27;US&#x27;,
            remote: true,
            employmentType: &#x27;full-time&#x27;,
            postedSince: &#x27;7d&#x27;,
            company: &#x27;airbnb&#x27;,
            page: 1
        });

    const response = await fetch(`${API_URL}?${params}`, {
      method: 'GET',
      headers: {
        'x-api-key': API_KEY
      }
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callJobSearchAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });
