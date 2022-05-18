# Todo List Web Design Recipe (Level One)

## 1. Describe the Problem

_THE USER WANTS TO BE ABLE TO ACCESS A TODO LIST THAT WILL STORE, UPDATE, DELETE AND LIST THE TASKS THEY NEED TO DO_

## 2. Design the Data Model Class

_This class should store and manage the data the server will hold._
_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class TodoList
  def initialize
  end

  def all
    # Returns a list of strings
    # THIS WILL RETURN THEIR ENTIRE TODO LIST
  end

  def add(task) # task is a string
    # No return value
    # DOES NOT RETURN A VALUE, BUT WILL ALLOW THE USER TO ADD A TODO ITEM TO THE LIST
  end

  def get(index) # index is a number
    # Returns a string, the task at the given index
    # THE USER WILL ASK FOR A SPECIFIC ITEM FROM THE TODO LIST AND THIS WILL RETURN THE ASKED FOR ITEM
  def

  def update(index, new_task) # index is a number, new_task is a string
    # Updates the task at index to be the text new_task
    # No return value
    # THIS WILL UPDATE THE TASK THAT THE USER GIVES THE INDEX FOR.
  end

  def remove(index) # index is a number
    # Deletes the task at index
    # REMOVES THE TODO ITEM FROM THE LIST BASED ON THE INDEX THE USER PROVIDES
  end
end
```

_Check it against these rules:_

> 1. Does it represent a collection (list or hash) of data?
> 2. Does it _at least_ have methods to:
>    1. List out all items in the resource
>    2. Create an item (C)
>    3. Get a single item (R)
>    4. Update an item (U)
>    5. Delete an item (D)
> 3. Does each method take only simple data types as arguments?  
>    Simple data types are: string, number, boolean.  
>    Methods can return lists, hashes & other objects, but not take them as
>    parameters.
> 
> Some of these rules will be relaxed later but will keep you safe for now.

## 3. Design the Web API (Requests)

_Design requests that perform each of the operations on your model class._
_Map them to the methods in your class._

```ruby
# EXAMPLE

# Request: GET /todos
todo_list.all

# GET /todos/:index
todo_list.get(index)

# POST /todos
# With data: { task: "Walk the dog" }
reminder.add(task)

# PATCH /todos/:index
# With data: { task: "Walk the cat" }
reminder.update(index, task)

# DELETE /todos/:index
reminder.remove(index)
```

> Remember:
> GET: Getting a single item or a list of items
> POST: Adding an item
> PATCH: Updating an item
> DELETE: Deleting an item

## 4. Create Examples

_Create examples of the requests and their responses in different scenarios._

```ruby
# EXAMPLE

# 1 - Getting an empty list of todos
Request: GET /todos
Response: """
You have nothing to do.
"""

# 2 - Adding a todo and listing it
Request: POST /todos
  Data: { task: "Walk the dog" }
Request: GET /todos
  Response: """
  1. Walk the dog
  """

# 3 - Adding multiple todos and listing them
Request: POST /todos
   Data: { task: "Walk the dog" }
Request: POST /todos
   Data: { task: "Walk the cat" }
Request: POST /todos
   Data: { task: "Walk the frog" }
Request: GET /todos
  Response: """
  1. Walk the dog
  2. Walk the cat
  3. Walk the frog
  """

# 3 - Adding multiple todos, deleting one, and listing them
Request: POST /todos
  Data: { task: "Walk the dog" }
Request: POST /todos
  Data: { task: "Walk the cat" }
Request: POST /todos
  Data: { task: "Walk the frog" }
Request: DELETE /todos/2
Request: GET /todos
  Response: """
  1. Walk the dog
  2. Walk the frog
  """

# 3 - Adding multiple todos, updating one, and listing them
Request: POST /todos
  Data: { task: "Walk the dog" }
Request: POST /todos
  Data: { task: "Walk the cat" }
Request: POST /todos
  Data: { task: "Walk the frog" }
Request: PATCH /todos/2
  Data: { task: "Walk the zebra" }
Request: GET /todos
  Response: """
  1. Walk the dog
  2. Walk the zebra
  2. Walk the frog
  """
```

## 5. Translate the Examples to Web Tests

_Translate your examples to tests using `Rack::Test`_

```ruby
# EXAMPLE

RSpec.describe "Todo Application" do
  it "gets an empty list of todos" do
    get "/todos"
    expect(last_response.body).to eq "You have nothing to do."
  end
end
```

## 6. Implement the Behaviour

_Follow this cycle:_

1. Add a web test in `/spec/web/` (RED)
2. Implement the behaviour in `app.rb`
3. Does it pass without data model changes? (GREEN) Then skip to step 6.
4. Otherwise, add a unit test for the data model to `/spec/unit` (RED)
5. Implement the behaviour in your data model class. (GREEN)
6. Apply any refactors to improve the structure of the code. (REFACTOR)  
   Run `rubocop` as part of this.
7. Go back to step 1.


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-one&prefill_File=recipe/recipe.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-one&prefill_File=recipe/recipe.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-one&prefill_File=recipe/recipe.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-one&prefill_File=recipe/recipe.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-one&prefill_File=recipe/recipe.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
