# frozen_string_literal: true

control 'dehydrated-script-install' do
  title 'Dehydrated script should be installed'

  describe file(input('dehydrated_script_path')) do
    it { should be_file }
    it { should be_owned_by input('dehydrated_file_owner') }
    its('content') { should include input('dehydrated_script_content') }
  end
end
