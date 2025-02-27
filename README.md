# Ruby Web Parser

A simple Ruby script for parsing web pages and analyzing their structure, designed for cybersecurity enthusiasts and penetration testers. This tool extracts headers (`<h1>`, `<h2>`) and links (`<a>` tags) from a website and can check for potential SQL Injection (SQLi) and Cross-Site Scripting (XSS) vulnerabilities.

## Features
- Extract headers (`<h1>`, `<h2>`) and links from any public website.
- Perform basic security checks for potential SQL Injection and XSS vulnerabilities (**for educational purposes only**).
- Command-line options for flexible usage:
  - `-h`, `--headers-only` → Extract only headers.
  - `-l`, `--links-only` → Extract only links.
  - `-v`, `--vulnerabilities` → Check for SQLi and XSS vulnerabilities.

## Requirements
- **Ruby** 3.x
- **Gems:**
  - `nokogiri` (~> 1.16)
  - `open-uri` (~> 0.3)

## Installation
1. Clone this repository:
   ```sh
   git clone https://github.com/v3rb4/ruby-web-parser.git
   ```
2. Navigate to the project directory:
   ```sh
   cd ruby-web-parser
   ```
3. Install dependencies:
   ```sh
   bundle install
   ```

## Usage
Run the script with a URL as an argument:

```sh
ruby web_parser.rb https://example.com
```

Use options for specific tasks, for example:

```sh
ruby web_parser.rb https://example.com -v  # Check for vulnerabilities
ruby web_parser.rb https://example.com -h  # Extract only headers
ruby web_parser.rb https://example.com -l  # Extract only links
```

## Disclaimer
This tool is intended for **educational and ethical cybersecurity research only**. Unauthorized scanning or attacking of websites without explicit permission from their owners **may violate laws and regulations**. Use responsibly.