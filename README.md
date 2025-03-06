# Get-Definition --- PowerShell cmdlet to Get a definition from Wordnik

## Description

This cmdlet looks up a word or phrase using the Wordnik API and displays the result.

## Installation

```powershell}
git clone https://github.com/hadenpike/Get-Definition.git C:/users/<user>/Documents/PowerShell/Modules/Get-Definition
```

As long as you cloned this repository to a path specified in $env:PSModulePath, you should be good to go. Otherwise, run
```powershell
Import-Module -Name /path/to/Get-Definition
```

## Setup

1. Go to ()(https://developer.wordnik.com) and sign up for an API key.
2. Create the environment variable WORDNIK_API_KEY with the API key as the value.
3. To make PowerShell see the new environment variable, either restart it or run
```powershell
refreshenv
```

## Usage

This cmdlet accepts the following parameters:
* Word: The word or phrase to look-up.
* APIKey: The API Key to use for the request. Defaults to $env:WORDNIK_API_KEY.

### Examples

```powershell
# Get a definition
Get-Definition -Word "perspicacity"
```

```powershell
# Use in a pipeline
"perspicacity" | Get-Definition
```
