require 'spec_helper'

describe "tasks/new" do
  before(:each) do
    assign(:task, stub_model(Task,
      :description => "MyString",
      :list_id => 1,
      :completed => false
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tasks_path, "post" do
      assert_select "input#task_description[name=?]", "task[description]"
      assert_select "input#task_list_id[name=?]", "task[list_id]"
      assert_select "input#task_completed[name=?]", "task[completed]"
    end
  end
end
