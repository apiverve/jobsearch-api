# Job Search API - Ruby Gem

Job Search is a jobs API that searches the open positions at thousands of companies at once. Search by job title keywords, location, country, remote work, employment type, posting date or company, and get the newest matching jobs first, each with its title, company, location, country, workplace type, posting date and apply link. Paid plans add salary ranges, a minimum salary filter, larger pages and each job's full description.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_jobsearch'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_jobsearch
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_jobsearch'

# Initialize the client
client = APIVerve::Jobsearch::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  keyword: "software engineer",
  location: "New York",
  country: "US",
  remote: true,
  employmentType: "full-time",
  postedSince: "7d",
  company: "airbnb",
  minSalary: 100000,
  page: 1
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ keyword: "software engineer", location: "New York", country: "US", remote: true, employmentType: "full-time", postedSince: "7d", company: "airbnb", minSalary: 100000, page: 1 })
  puts response["data"]
rescue APIVerve::Jobsearch::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Jobsearch::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Jobsearch::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/jobsearch?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/jobsearch?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/jobsearch?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
