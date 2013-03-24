require 'spec_helper'

<%- local_class_name = class_name.split('::')[-1] -%>
<%-
begin
  local_class = local_class_name.constantize
  output_attributes = local_class_name.constantize.accessible_attributes.reject { |a| a.blank? }
rescue NameError
  local_class = nil
  output_attributes = []
end -%>
describe "<%= class_name.pluralize %>" do
  describe "<%= file_name.humanize.pluralize %> management" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_user @user
      @attributes = FactoryGirl.attributes_for(:<%= file_name %>)
    end
    it "displays a <%= file_name.humanize %>" do
      @<%= file_name %> = FactoryGirl.create(:<%= file_name %>)
      visit <%= index_helper %>_path
      page.should have_content(@<%= file_name %>.id)
      click_link @<%= file_name %>.<%= output_attributes[0] %>

      # <%= index_helper.singularize %>_path(<%= file_name %>.id)
      <%- output_attributes.each do |attribute| -%>
      page.should have_content("<%= attribute.humanize %>:")
      <%- end -%>
    end
    it "adds a new <%= file_name.humanize %> and displays the results" do
      visit <%= index_helper %>_path
      click_link "New"

      # new_<%= index_helper.singularize %>_path
      <%- output_attributes.each do |attribute| -%>
      fill_in "<%= attribute.humanize %>", :with => @attributes[:<%= attribute %>].to_s
      <%- end -%>
      click_button "Create <%= file_name.humanize %>"

      # <%= index_helper.singularize %>_path(<%= file_name %>.id)
      page.should have_content("<%= file_name.humanize %> was successfully created")
    end
    it "updates an existing <%= file_name.humanize %> and displays the results" do
      @<%= file_name %> = FactoryGirl.create(:<%= file_name %>)
      visit <%= index_helper %>_path
      page.should have_content(@<%= file_name %>.id)
      click_link "Edit"

      # edit_<%= index_helper.singularize %>_path(<%= file_name %>.id)
      <%- output_attributes.each do |attribute| -%>
      fill_in "<%= attribute.humanize %>", :with => @attributes[:<%= attribute %>].to_s
      <%- end -%>
      click_button "Update <%= file_name.humanize %>"

      # <%= index_helper.singularize %>_path(<%= file_name %>.id)
      page.should have_content("<%= file_name.humanize %> was successfully updated")
    end
  end
end