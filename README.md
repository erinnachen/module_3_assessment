## Storedom

Storedom is a simplistic e-commerce application used for various lessons and tutorials at Turing.

### Setup

To get set up with the storedom application, clone it
via `git` and pull in gem dependencies with `bundler`:

```sh
$ git clone https://github.com/turingschool-examples/storedom.git
$ cd storedom
$ bundle update
```

And set up the database and included seed records:

```
bundle exec rake db:{create,setup}
```
### Module 3 Final Assessment
The details of the assessment can be found [here.](https://gist.github.com/jmejia/0a3ad37d4cb3bcde694d752c45a8c17c)
#### Building an API
The following RESTful endpoints for items were added, returns are in JSON format:

* `GET /api/v1/items` returns all items
* `GET /api/v1/items/:id` returns a single items
* `POST /api/v1/items` creates a new item and returns the item
* `DELETE /api/v1/items/:id` deletes the item with :id

#### Consuming a 3rd party API (BestBuy)
The website has a search field in the navigation bar which allows for searching by description of the Best Buy API via the products endpoint. Details can be found [here.](https://developer.bestbuy.com/documentation/products-api#documentation/products-api)
