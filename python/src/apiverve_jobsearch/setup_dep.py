from setuptools import setup, find_packages

setup(
    name='apiverve_jobsearch',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Job Search is a jobs API that searches the open positions at thousands of companies at once. Search by job title keywords, location, country, remote work, employment type, posting date or company, and get the newest matching jobs first, each with its title, company, location, country, workplace type, posting date and apply link. Paid plans add salary ranges, a minimum salary filter, larger pages and each job's full description.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/jobsearch?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
