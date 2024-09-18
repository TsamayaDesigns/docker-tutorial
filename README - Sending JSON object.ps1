# ************************************************************************
# Docker Docs: https://docs.docker.com/guides/language/python/develop/
# ************************************************************************ 

# Sending a single JSON object
Invoke-WebRequest -Method Post -Uri 'http://127.0.0.1:8001/heroes/' -Headers @{
    'accept' = 'application/json'
    'Content-Type' = 'application/json'
} -Body '{
    "id": 3,
    "name": "my 3rd hero",
    "secret_name": "Geno-3",
    "age": 21
}'

# Sending multiple JSON objects
Invoke-WebRequest -Method Post -Uri 'http://127.0.0.1:8001/heroes/' -Headers @{
    'accept' = 'application/json'
    'Content-Type' = 'application/json'
} -Body '[
    {
        "id": 3,
        "name": "my 3rd hero",
        "secret_name": "Geno-3",
        "age": 21
    },
    {
        "id": 4,
        "name": "my 4th hero",
        "secret_name": "Geno-4",
        "age": 30
    }
    ]'

# If the above "Sending multiple JSON objects" fails, try the following (looping in PowerShell)
$heroes = @(
    @{
        "id" = 3
        "name" = "my 3rd hero"
        "secret_name" = "Geno-3"
        "age" = 21
    },
    @{
        "id" = 4
        "name" = "my 4th hero"
        "secret_name" = "Geno-4"
        "age" = 30
    }
)

foreach ($hero in $heroes) {
    Invoke-WebRequest -Method Post -Uri 'http://127.0.0.1:8001/heroes/' -Headers @{
        'accept' = 'application/json'
        'Content-Type' = 'application/json'
    } -Body ($hero | ConvertTo-Json)
}


Invoke-WebRequest -Method Get -Uri 'http://127.0.0.1:8001/heroes/' -Headers @{
    'accept' = 'application/json'
}
