# pokemon-type-chart

Microservice for retrieving Pokémon type effectiveness chart.

## Getting Started

### Requirements

Elixir `v1.18.0`

### Usage

Install dependencies:

```sh
mix deps.get
```

Start the server:

```sh
mix run --no-halt
```

Send a POST request to `/pokemon/type/chart` with a JSON body:

```json
{
   "pokemon": {
     "name": "Dragonite",
     "types": [
        "Dragon",
        "Flying"
     ]
   }
}
```

Example using `curl`:

```sh
curl -X POST http://localhost:4000/pokemon/type/chart \
  -H "Content-Type: application/json" \
  -d '{"pokemon": {"name": "Dragonite", "types": ["Dragon", "Flying"]}}'
```

### Docker

If you prefer to run this service in a Docker container, you can do so by following these steps:

Build the Docker image:
```sh
docker build -t pokemon_type_chart .
```

Run the Docker container:
```sh
docker run -p 4000:4000 pokemon_type_chart
```

### API

- **POST /pokemon/type/chart**  
  Request body:
  ```json
  {
    "pokemon": {
      "name": "string",
      "types": ["string"]
    }
  }
  ```
  Response:
  ```json
  {
    "pokemon": { 
      "name": "string",
      "types": ["string"]
    },
    "type_chart": { 
        "weaknesses": ["string"],
        "resitances": ["string"],
        "immunities": ["string"]
     }
  }
  ```

