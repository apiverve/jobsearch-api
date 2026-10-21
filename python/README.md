Job Search API
============

Job Search is a jobs API that searches the open positions at thousands of companies at once. Search by job title keywords, location, country, remote work, employment type, posting date or company, and get the newest matching jobs first, each with its title, company, location, country, workplace type, posting date and apply link. Paid plans add salary ranges, a minimum salary filter, larger pages and each job's full description.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-jobsearch.svg)](https://pypi.org/project/apiverve-jobsearch/)

This is a Python wrapper for the [Job Search API](https://apiverve.com/marketplace/jobsearch?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-jobsearch
```

Using `pip3`:

```bash
pip3 install apiverve-jobsearch
```

---

## Configuration

Before using the Job Search API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_jobsearch.apiClient import JobsearchAPIClient

# Initialize the client with your APIVerve API key
api = JobsearchAPIClient("[YOUR_API_KEY]")

query = {
    "keyword": "software engineer",
    "location": "New York",
    "country": "US",
    "remote": true,
    "employmentType": "full-time",
    "postedSince": "7d",
    "company": "airbnb",
    "minSalary": 100000,
    "page": 1
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Job Search API documentation is found here: [https://docs.apiverve.com/ref/jobsearch](https://docs.apiverve.com/ref/jobsearch?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_jobsearch.apiClient import JobsearchAPIClient

# Initialize the client with your APIVerve API key
api = JobsearchAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "keyword": "software engineer",
    "location": "New York",
    "country": "US",
    "remote": true,
    "employmentType": "full-time",
    "postedSince": "7d",
    "company": "airbnb",
    "minSalary": 100000,
    "page": 1
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "page": 1,
    "count": 2,
    "hasMore": true,
    "jobs": [
      {
        "id": "b4f50cb0115efeef41cb",
        "title": "Senior Network and Cloud Engineer",
        "company": "Acturis",
        "location": "London, England, United Kingdom",
        "locations": [
          "London, England, United Kingdom"
        ],
        "country": "GB",
        "remote": false,
        "workplaceType": "hybrid",
        "employmentType": "full-time",
        "postedAt": "2026-10-14T15:37:26.000Z",
        "url": "https://careers.acturis.com/o/senior-network-and-cloud-engineer",
        "applyUrl": "https://careers.acturis.com/o/senior-network-and-cloud-engineer/c/new",
        "salary": {
          "min": null,
          "max": null,
          "currency": null,
          "interval": null
        }
      },
      {
        "id": "43175a4af41a8c5a9a3b",
        "title": "Senior AI Engineer in Computer Vision",
        "company": "Faktion BV",
        "location": "Antwerp, Vlaams Gewest, Belgium",
        "locations": [
          "Antwerp, Vlaams Gewest, Belgium"
        ],
        "country": "BE",
        "remote": false,
        "workplaceType": "hybrid",
        "employmentType": "full-time",
        "postedAt": "2026-08-24T13:17:35.000Z",
        "url": "https://talent.faktion.com/o/senior-ai-engineer-in-computer-vision",
        "applyUrl": "https://talent.faktion.com/o/senior-ai-engineer-in-computer-vision/c/new",
        "salary": {
          "min": null,
          "max": null,
          "currency": null,
          "interval": null
        }
      }
    ]
  }
}
```

---

## Error Handling

The API client provides comprehensive error handling through the `JobsearchAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_jobsearch.apiClient import JobsearchAPIClient, JobsearchAPIClientError

api = JobsearchAPIClient("[YOUR_API_KEY]")

query = {
    "keyword": "software engineer",
    "location": "New York",
    "country": "US",
    "remote": true,
    "employmentType": "full-time",
    "postedSince": "7d",
    "company": "airbnb",
    "minSalary": 100000,
    "page": 1
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except JobsearchAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_jobsearch.apiClient import JobsearchAPIClient, JobsearchAPIClientError

api = JobsearchAPIClient("[YOUR_API_KEY]")

query = {
    "keyword": "software engineer",
    "location": "New York",
    "country": "US",
    "remote": true,
    "employmentType": "full-time",
    "postedSince": "7d",
    "company": "airbnb",
    "minSalary": 100000,
    "page": 1
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except JobsearchAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_jobsearch.apiClient import JobsearchAPIClient, JobsearchAPIClientError

query = {
    "keyword": "software engineer",
    "location": "New York",
    "country": "US",
    "remote": true,
    "employmentType": "full-time",
    "postedSince": "7d",
    "company": "airbnb",
    "minSalary": 100000,
    "page": 1
}

# Using context manager ensures proper cleanup
with JobsearchAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except JobsearchAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_jobsearch.apiClient import JobsearchAPIClient

# Enable debug mode
api = JobsearchAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "keyword": "software engineer",
    "location": "New York",
    "country": "US",
    "remote": true,
    "employmentType": "full-time",
    "postedSince": "7d",
    "company": "airbnb",
    "minSalary": 100000,
    "page": 1
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_jobsearch.apiClient import JobsearchAPIClient

api = JobsearchAPIClient("[YOUR_API_KEY]")

query = {
    "keyword": "software engineer",
    "location": "New York",
    "country": "US",
    "remote": true,
    "employmentType": "full-time",
    "postedSince": "7d",
    "company": "airbnb",
    "minSalary": 100000,
    "page": 1
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
