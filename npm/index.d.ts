declare module '@apiverve/jobsearch' {
  export interface jobsearchOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface jobsearchResponse {
    status: string;
    error: string | null;
    data: JobSearchData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface JobSearchData {
      page:    number | null;
      count:   number | null;
      hasMore: boolean | null;
      jobs:    Job[];
  }
  
  interface Job {
      id:             null | string;
      title:          null | string;
      company:        null | string;
      location:       null | string;
      locations:      (null | string)[];
      country:        null | string;
      remote:         boolean | null;
      workplaceType:  null | string;
      employmentType: null | string;
      postedAt:       Date | null;
      url:            null | string;
      applyURL:       null | string;
      salary:         Salary;
  }
  
  interface Salary {
      min:      null;
      max:      null;
      currency: null;
      interval: null;
  }

  export default class jobsearchWrapper {
    constructor(options: jobsearchOptions);

    execute(callback: (error: any, data: jobsearchResponse | null) => void): Promise<jobsearchResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: jobsearchResponse | null) => void): Promise<jobsearchResponse>;
    execute(query?: Record<string, any>): Promise<jobsearchResponse>;
  }
}
