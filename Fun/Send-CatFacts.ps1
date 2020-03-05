function Send-CatFacts {
    param (
       # Parameter help description
       [Parameter()]
       [string]
       $ComputerName
    )
    Invoke-Command -ComputerName $ComputerName -ScriptBlock {
        #$SpeechSynth.GetInstalledVoices().VoiceInfo
        Add-Type -AssemblyName System.Speech
        $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $SpeechSynth.SelectVoice("Microsoft Zira Desktop")
        $Browser = New-Object System.Net.WebClient
        $Browser.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $CatFact = (ConvertFrom-Json (Invoke-WebRequest -Verbose -Uri https://catfact.ninja/fact -UseBasicParsing))
        $CatFact.fact
        $SpeechSynth.Speak("Did you know ?")
        $SpeechSynth.Speak($CatFact.fact)
    }
}
