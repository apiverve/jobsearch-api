"""
Job Search API - Basic Usage Example

This example demonstrates the basic usage of the Job Search API.
API Documentation: https://docs.apiverve.com/ref/jobsearch
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/jobsearch'

def call_jobsearch_api():
    """
    Make a GET request to the Job Search API
    """
    try:
        # Query parameters
        params &#x3D; {&#x27;keyword&#x27;: &#x27;software engineer&#x27;, &#x27;location&#x27;: &#x27;New York&#x27;, &#x27;country&#x27;: &#x27;US&#x27;, &#x27;remote&#x27;: true, &#x27;employmentType&#x27;: &#x27;full-time&#x27;, &#x27;postedSince&#x27;: &#x27;7d&#x27;, &#x27;company&#x27;: &#x27;airbnb&#x27;, &#x27;page&#x27;: 1}

        headers = {
            'x-api-key': API_KEY
        }

        response = requests.get(API_URL, headers=headers, params=params)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling Job Search API...\n')

    result = call_jobsearch_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
