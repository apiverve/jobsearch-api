using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.JobSearch
{
    /// <summary>
    /// Query options for the Job Search API
    /// </summary>
    public class JobSearchQueryOptions
    {
        /// <summary>
        /// Words that must all appear in the job title, for example data engineer or product designer.
        /// </summary>
        [JsonProperty("keyword")]
        public string Keyword { get; set; }

        /// <summary>
        /// Return only jobs with a location containing this text, for example London, New York or Bavaria.
        /// </summary>
        [JsonProperty("location")]
        public string Location { get; set; }

        /// <summary>
        /// Return only jobs in this country: an ISO 3166 code or a name, for example US, GB or Germany.
        /// </summary>
        [JsonProperty("country")]
        public string Country { get; set; }

        /// <summary>
        /// true returns only jobs open to remote work; false only jobs that are not.
        /// </summary>
        [JsonProperty("remote")]
        public bool? Remote { get; set; }

        /// <summary>
        /// Return only jobs of this employment type. Jobs that give no employment type are kept, since many companies leave it blank; only jobs of another type are left out.
        /// </summary>
        [JsonProperty("employmentType")]
        public string EmploymentType { get; set; }

        /// <summary>
        /// Return only jobs first published at or after this date or date-time (ISO 8601, for example 2026-10-01), or within this age: a number followed by h, d or w, for example 12h, 7d or 2w.
        /// </summary>
        [JsonProperty("postedSince")]
        public string PostedSince { get; set; }

        /// <summary>
        /// Return only jobs at this company, by its career board name, usually the company name in lowercase, for example airbnb.
        /// </summary>
        [JsonProperty("company")]
        public string Company { get; set; }

        /// <summary>
        /// Return only jobs whose salary range reaches at least this amount, in the job's own currency and pay period. Jobs that publish no salary are left out when this is set.
        /// </summary>
        [JsonProperty("minSalary")]
        public double? MinSalary { get; set; }

        /// <summary>
        /// Page of results: 10 jobs per page up to page 5 on the free plan, 50 per page up to page 10 on paid plans.
        /// </summary>
        [JsonProperty("page")]
        public int? Page { get; set; }
    }
}
