require 'spec_helper'

<%-

local_class_name = class_name.split('::')[-1]

parent_parts = []
AuthorizedRailsScaffolds.config.parent_models.each do |model|
  parent_parts << model.underscore
end

request_path = index_helper[0..-(file_name.length + 2)]
request_params = ''
if parent_parts.any?
  request_path += parent_parts.join('_')
  request_path += "_"
  request_params = '(' + parent_parts.join(', ') + ')'
end
request_path += file_name


-%>
describe "<%= class_name.pluralize %>" do
  describe "admin <%= local_class_name %> management" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_user @user
    end

    # This should return the minimal set of attributes required to create a valid
    # <%= local_class_name %>.
    def valid_create_attributes
      FactoryGirl.attributes_for(:<%= file_name %>)
    end

    it "creates a <%= local_class_name %> and redirects to the <%= local_class_name %>'s page" do
      get new_<%= request_path.singularize %>_path<%= request_params %>
      expect(response).to render_template(:new)

      post <%= request_path.singularize %>_path<%= request_params %>, :<%= file_name %> => valid_create_attributes

      expect(response).to redirect_to(assigns(:<%= file_name %>))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("<%= local_class_name %> was successfully created.")
    end

  end
end