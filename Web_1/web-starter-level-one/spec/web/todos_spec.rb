RSpec.describe "Todo list Web Resource" do
  it "lists out an empty todo list" do
    get "/todos"
    expect(last_response.body).to eq ("You have no tasks to do! \n")
  end

  it "adds a task and then lists out the tasks" do
    post "/todos", task: "Walk the dog"
    expect(last_response.body).to eq ("You have added a task. \n")

    get "/todos"
    expect(last_response.body). to eq ("1. Walk the dog\n")
  end

  it "adds multiple tasks and then lists them with the index number" do
    post "/todos", task: "Walk the dog"
    post "/todos", task: "Do the shopping"
    post "/todos", task: "Do your homework"

    get "/todos"
    expect(last_response.body).to eq (
      "1. Walk the dog\n" +
      "2. Do the shopping\n" +
      "3. Do your homework\n"
    )
  end

  it "adds multiple tasks and then lists them out without the index number" do
    post "/todos", task: "Walk the dog"
    post "/todos", task: "Do the shopping"
    post "/todos", task: "Do your homework"

    get "/todos/1"
    expect(last_response.body).to eq(
      "Walk the dog\n" +
      "Do the shopping\n" +
      "Do your homework\n"
      )
  end
end