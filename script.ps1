param(
    [string]$assemblyPath = "path\to\your\test\assembly.dll"
)

Add-Type -AssemblyName "System.Reflection"

function Get-TestMethodsAndTestCaseIds {
    param(
        [System.Reflection.Assembly]$assembly
    )

    $testMethods = $assembly.GetTypes() | 
        ForEach-Object { $_.GetMethods() } | 
        Where-Object { $_.GetCustomAttributes($false) | 
        Where-Object { $_.GetType().Name -eq "AzureTestCaseIdAttribute" } }

    foreach ($method in $testMethods) {
        $attr = $method.GetCustomAttributes($false) | Where-Object { $_.GetType().Name -eq "AzureTestCaseIdAttribute" }
        [PSCustomObject]@{
            MethodName = $method.Name
            TestCaseId = $attr.TestCaseId
        }
    }
}

$assembly = [System.Reflection.Assembly]::LoadFrom($assemblyPath)
$testMethodsAndIds = Get-TestMethodsAndTestCaseIds -assembly $assembly

foreach ($testMethodAndId in $testMethodsAndIds) {
    Write-Output "Method: $($testMethodAndId.MethodName) has Test Case ID: $($testMethodAndId.TestCaseId)"
    # Here you could add logic to call Azure DevOps API and update test results
}
