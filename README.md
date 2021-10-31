# Weather Getter API ![Circle CI Status](https://circleci.com/gh/NoahZinter/weather_getter_api.svg?style=svg)

## Dev: [Noah Zinter](linkedin.com/in/noahzinter)

---

# Overview

#### This Api aggregates data from the OpenWeather Api, Unsplash Photo Api, and Mapquest Api to allow a user to get forecasts for a given city, and to input two cities to retrieve roadtrip travel time and a weather forecast in destination city for road trip eta. 

---
# Table of Contents
  - [Overview](#overview)
  - [Setup](#setup)
  - [Endpoints](#endpoints)
  - [City Forecast](#city-forecast)
  - [City Background Image](#city-background-image)
  - [User Registration](#user-registration)
  - [User Edit](#user-edit)
  - [Session Create](#session-create)
  - [Road Trip Create](#road-trip-create)
  - [Road Trip Edit](#road-trip-edit)
  - [Road Trip Delete](#road-trip-delete)
---

# Setup

This project  is in `Ruby 2.7.2` and `Rails 5.2.6`

To access Api endpoints on [Heroku](https://weathergetter-api.herokuapp.com/) send requests to _https://weathergetter-api.herokuapp.com/api/v1_
You will have to visit the [User Registration]() endpoint first to register and receive your Weather Getter API key.

To clone this project you'll need API keys from:
[OpenWeatherMap API](https://openweathermap.org/api)
[Mapquest API](https://developer.mapquest.com/documentation/)
[Unsplash API](https://unsplash.com/developers)

To store api keys after cloning first run
`bundle install`
Then use the [figaro](https://github.com/laserlemon/figaro) gem to set up your `application.yml` file. 
To use `figaro` run `bundle exec figaro install` and then in your new `application.yml` file set up enivronment variables like so:
```
MAPQUEST_API_KEY: yourkeygoeshere
OPENWEATHER_API_KEY: adifferentkey8
UNSPLASH_API_KEY: yougettheidea
```

---

# Endpoints

#### This API exposes the following endpoints
---

* ## City Forecast 
    `GET /api/v1/forecast` 
    This endpoint takes a query param of `location` set to a city and state like so 
    `/api/v1/forecast?location=denver,co`
    City Forecast will return a serialized JSON response with a weather forecast for the location with attributes of `current_weather` describing weather right now, `daily_weather` for a 5 day forecast, and `hourly_weather` for an 8 hour forecast from the current time. 

    ## Example Response
    
```
{
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "current": {
                "datetime": "2021-08-11T07:25:48.000+00:00",
                "sunrise": "2021-08-11T12:08:38.000+00:00",
                "sunset": "2021-08-12T02:01:41.000+00:00",
                "temperature": 70.66,
                "feels_like": 68.88,
                "humidity": 31,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "overcast clouds",
                "icon": "04n"
            },
            "daily": [
                {
                    "date": "2021-08-11",
                    "sunrise": "2021-08-11T12:08:38.000+00:00",
                    "sunset": "2021-08-12T02:01:41.000+00:00",
                    "max_temp": 96.93,
                    "min_temp": 70.66,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-08-12",
                    "sunrise": "2021-08-12T12:09:35.000+00:00",
                    "sunset": "2021-08-13T02:00:25.000+00:00",
                    "max_temp": 90.43,
                    "min_temp": 74.46,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-08-13",
                    "sunrise": "2021-08-13T12:10:32.000+00:00",
                    "sunset": "2021-08-14T01:59:08.000+00:00",
                    "max_temp": 94.59,
                    "min_temp": 70.59,
                    "conditions": "heavy intensity rain",
                    "icon": "10d"
                },
                {
                    "date": "2021-08-14",
                    "sunrise": "2021-08-14T12:11:29.000+00:00",
                    "sunset": "2021-08-15T01:57:50.000+00:00",
                    "max_temp": 93.51,
                    "min_temp": 69.73,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-08-15",
                    "sunrise": "2021-08-15T12:12:27.000+00:00",
                    "sunset": "2021-08-16T01:56:31.000+00:00",
                    "max_temp": 97.05,
                    "min_temp": 74.12,
                    "conditions": "light rain",
                    "icon": "10d"
                }
            ],
            "hourly": [
                {
                    "time": "2021-08-11T07:00:00.000+00:00",
                    "temperature": 70.66,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                    "time": "2021-08-11T08:00:00.000+00:00",
                    "temperature": 71.91,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                    "time": "2021-08-11T09:00:00.000+00:00",
                    "temperature": 72.72,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "2021-08-11T10:00:00.000+00:00",
                    "temperature": 73.06,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "2021-08-11T11:00:00.000+00:00",
                    "temperature": 73.13,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "2021-08-11T12:00:00.000+00:00",
                    "temperature": 72.7,
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "2021-08-11T13:00:00.000+00:00",
                    "temperature": 73.27,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "2021-08-11T14:00:00.000+00:00",
                    "temperature": 76.32,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "id": "null"
        }
    }
}
```
---
* ## City Background Image
  `GET /api/v1/backgrounds`
  This endpoint also takes a query param of `location` as above:
  `/api/v1/backgrounds?location=denver,co`
  The response will return one most-relevant photo from Unsplash in a serialized JSON response with attributes of `image` and `credit`
  
  Example Response:
  
```
{
    "data": {
        "id": "null",
        "type": "image",
        "attributes": {
            "image": {
                "location": "denver,co",
                "image_url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTIxMDB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2Mjg2Mjk1NTQ&ixlib=rb-1.2.1&q=80&w=1080"
            },
            "credit": {
                "source": "https://unsplash.com",
                "author": "rdehamer",
                "logo": "https://unsplash.com/photos/QdqK4doOzcQ"
            }
        }
    }
}

```
---
  
* ## User Registration
 To create (register) a User, post to the following route. Include relevant User details in the body of the post request, and not as params. Expect appropriate error messages if email is taken or missing, or is password is missing or mis-matched. 
  
 `POST /api/v1/users`
 Body: 
 
 ```
 {
    "email": "7@user.com",
    "password": "secret", 
    "password_confirmation": "secret"
}
```
 
 Upon successful User registration, the JSON response will include User id, email, and a randomly-generated API key to be used for Road Trip creation. 
 
 Example Response: 
 
 ```
 {
    "data": {
        "id": "6",
        "type": "users",
        "attributes": {
            "email": "7@user.com",
            "api_key": "rand0mlygen3ratedstr1ing"
        }
    }
}
 
 ```
 
 ---
 
 * ## User Edit

  Future iterations will allow for editing of users at endpoint
  
  `PATCH /api/v1/users/:id`
  
  Body: 
  ```
  {
    "email": "7@user.com",
    "password": "secret", 
    "password_confirmation": "secret"
}
```
  
  Password may be edited with this endpoint, but will still require confirmation. Expect appropriate errors if email or password is blank, or if password and confirmation do not match. 
  
  
  
---

* ## Session Create

  For an already-registered User to login (or create a session) send a request to 
  
  ` POST /api/v1/sessions `
  
  with the User email and password in the body. 
  
  Body: 
  
  ```
   {
    "email": "4@user.com",
    "password": "secret"
   }
   ```
   

The body of this response should be the same as upon User Registration, including the same API key. 

Expected Response:

```

 {
    "data": {
        "id": "6",
        "type": "users",
        "attributes": {
            "email": "7@user.com",
            "api_key": "rand0mlygen3ratedstr1ing"
        }
    }
}

```



---

* ## Road Trip Create

  A registered User can use their API key to create a road trip from one location to another. The endpoint is:
  
  ` POST /api/v1/road_trip `
  
  The content of the request should be sent in the body like so: 
  
  Body: 
  
  ```
  {
    "origin": "new york,ny",
    "destination": "los angeles,ca",
    "api_key": "rand0mlygen3ratedstr1ing"
    }
    ```
    
  The JSON response for a valid request should look like so, 
  
  Example Response: 
  
  ```
  {
    "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
            "start_city": "new york,ny",
            "end_city": "los angeles,ca",
            "travel_time": "40 hours, 16 minutes",
            "weather_at_eta": {
                "temperature": 61.93,
                "conditions": "overcast clouds"
            }
        }
    }
  }
  ```
  
  Expect appropriate errors if API key is missing/incorrect, or if road trip is impossible. For example, expected JSON response for a road trip from New York, NY to London would be: 
  
  ```
  
  
  ```
   
  

---

