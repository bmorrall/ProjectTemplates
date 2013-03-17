require 'spec_helper'

<% local_class_name = class_name.split('::')[-1] -%>
<% output_attributes = attributes.reject{|attribute| [:datetime, :timestamp, :time, :date].index(attribute.type) } -%>
describe "<%= ns_table_name %>/new" do
  before(:each) do
    assign(:<%= file_name %>, FactoryGirl.build(:<%= file_name %><%= output_attributes.empty? ? '))' : ',' %>
<% output_attributes.each_with_index do |attribute, attribute_index| -%>
      :<%= attribute.name %> => <%= attribute.default.inspect %><%= attribute_index == output_attributes.length - 1 ? '' : ','%>
<% end -%>
<%= !output_attributes.empty? ? "    ))\n  end" : "  end" %>

  it "renders new <%= file_name %> form" do
    render

<% if webrat? -%>
    rendered.should have_selector("form", :action => <%= table_name %>_path, :method => "post") do |form|
<% for attribute in output_attributes -%>
      form.should have_selector("<%= attribute.input_type -%>#<%= file_name %>_<%= attribute.name %>", :name => "<%= file_name %>[<%= attribute.name %>]")
<% end -%>
    end
<% else -%>
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", <%= index_helper %>_path, "post" do
<% for attribute in output_attributes -%>
      assert_select "<%= attribute.input_type -%>#<%= file_name %>_<%= attribute.name %>[name=?]", "<%= file_name %>[<%= attribute.name %>]"
<% end -%>
    end
<% end -%>
  end
end