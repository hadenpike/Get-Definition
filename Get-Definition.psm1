# Get-Definition.psm1 --- Get a definition from Wordnik
#
# Author: Haden Pike <haden@hadenpike.net>
#
# Copyright (c) 2025 Haden Pike
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

<#
 .Synopsis
  Get a definition from Wordnik .

 .Description
  This cmdlet looks up a word or phrase using the Wordnik API and displays the result.

 .Parameter Word
  The word or phrase to look-up.

 .Parameter APIKey
  The API Key to use for the request. Defaults to $env:WORDNIK_API_KEY.

 .Example
  # Get a definition
  Get-Definition -Word "perspicacity"

 .Example
  # Use in a pipeline
  "perspicacity" | Get-Definition
  #>
  function Get-Definition {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [string] $Word,
        [string]$APIKey = $env:WORDNIK_API_KEY
    )

    process {
        # Construct the API URL
        $url = "http://api.wordnik.com/v4/word.json/$Word/definitions?api_key=$APIKey"
        $response = Invoke-RestMethod -Uri $url -Method Get -ContentType "application/json"

        # Output the definitions
        $response | ForEach-Object {
            Write-Host "$($_.attributionText)"
            Write-Host "$($_.word), $($_.partOfSpeech)"
            Write-Host "$($_.text)"
            Write-Host ""
        }
    }
}
