## SKYDROP overweight exercise

Application for process labels packages and calculates if there is an overweight directly in the Fedex services.

#### Requirements:

* Ruby version
    - ruby: 2.6.3

* System dependencies
     - Rails: 6.0.2
     - Postgres

#### Instalation

Run:

```
bundle install
```

Create Database:

```
rake db:create
rake db:migrate
```

Run server: 

```
rails s
```

#### Test suite

For execute test run:

```
rails test
```

#### LiveDemo

https://skydrop.herokuapp.com/

### API Package service

**Method:** POST

**Endpoint:** `api/v1/packages`

**Body:** 

```bash
curl -X POST \
  http://0.0.0.0:3000/api/v1/packages \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 3da1f1d5-a7f5-4c8b-b94a-eafd8a10ca14' \
  -H 'cache-control: no-cache' \
  -d '{
	"package":[
	  {
	    "tracking_number":"149331877648230",
	    "carrier":"FEDEX",
	    "parcel":{
	      "length":29.7,
	      "width":5,
	      "height":21,
	      "weight":2.0,
	      "distance_unit":"CM",
	      "mass_unit":"KG"
	    }
	  }
	]
}
'
```

**Response:**

```
[
    {
        "tracking_number": "149331877648230",
        "carrier": "FEDEX",
        "parcel": {
            "length": 29.7,
            "width": 5,
            "height": 21,
            "weight": 2,
            "distance_unit": "CM",
            "mass_unit": "KG"
        },
        "overweight": true,
        "fedex_volumetric_weight": 9,
        "higher_label_weight": 2,
        "tag_processed": true
    }
]
```

#### Configuration

You can change the next enviroment variables:

```
# Fedex Service Vars
export FEDEX_KEY='yourfaboulousvar'
export FEDEX_PASSWORD='yourfaboulousvar'
export FEDEX_ACCOUNT_NUMBER='yourfaboulousvar'
export FEDEX_METER='yourfaboulousvar'
export FEDEX_MODE='yourfaboulousvar'
# Database Var
export SKYDROP_HOST_DB='yourfaboulousvar'
export SKYDROP_USER_DB='yourfaboulousvar'
export SKYDROP_PASS_DB='yourfaboulousvar'
export SKYDROP_DB_PORT='yourfaboulousvar'
export SKYDROP_DB_NAME='yourfaboulousvar'
```
