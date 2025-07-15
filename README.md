# pokemo-type-chart

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

### API

- **POST /pokemon/type/chart**  
  Request body:
  ```json
  {
    "pokemon": {
      "name": "string",
      "types": ["string", ...]
    }
  }
  ```
  Response:
  ```json
  {
    "pokemon": { 
      "name": "string",
      "types": ["string", ...]
    },
    "type_chart": { 
        "weaknesses": ["string", ...],
        "resitances": ["string", ...],
        "immunities": ["string", ...]
     }
  }
  ```

