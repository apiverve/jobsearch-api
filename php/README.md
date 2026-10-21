# Job Search API - PHP Package

Job Search is a jobs API that searches the open positions at thousands of companies at once. Search by job title keywords, location, country, remote work, employment type, posting date or company, and get the newest matching jobs first, each with its title, company, location, country, workplace type, posting date and apply link. Paid plans add salary ranges, a minimum salary filter, larger pages and each job's full description.

## Installation

Install via Composer:

```bash
composer require apiverve/jobsearch
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Jobsearch\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'keyword' => 'software engineer',
    'location' => 'New York',
    'country' => 'US',
    'remote' => true,
    'employmentType' => 'full-time',
    'postedSince' => '7d',
    'company' => 'airbnb',
    'minSalary' => 100000,
    'page' => 1
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Jobsearch\Client;
use APIVerve\Jobsearch\Exceptions\APIException;
use APIVerve\Jobsearch\Exceptions\ValidationException;

try {
    $response = $client->execute(['keyword' => 'software engineer', 'location' => 'New York', 'country' => 'US', 'remote' => true, 'employmentType' => 'full-time', 'postedSince' => '7d', 'company' => 'airbnb', 'minSalary' => 100000, 'page' => 1]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/jobsearch?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/jobsearch?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/jobsearch?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
