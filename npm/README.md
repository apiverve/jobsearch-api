# Job Search API

Job Search is a jobs API that searches the open positions at thousands of companies at once. Search by job title keywords, location, country, remote work, employment type, posting date or company, and get the newest matching jobs first, each with its title, company, location, country, workplace type, posting date and apply link. Paid plans add salary ranges, a minimum salary filter, larger pages and each job's full description.

[![npm version](https://img.shields.io/npm/v/@apiverve/jobsearch.svg)](https://www.npmjs.com/package/@apiverve/jobsearch)

This is a JavaScript wrapper for the [Job Search API](https://apiverve.com/marketplace/jobsearch?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/jobsearch
```

Using yarn:
```shell
yarn add @apiverve/jobsearch
```

---

## Configuration

Before using the Job Search API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Job Search API documentation is found here: [https://docs.apiverve.com/ref/jobsearch](https://docs.apiverve.com/ref/jobsearch?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const jobsearchAPI = require('@apiverve/jobsearch');
const api = new jobsearchAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
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

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
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

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
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

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

## Example Response

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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
