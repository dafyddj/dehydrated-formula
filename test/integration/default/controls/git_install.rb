# frozen_string_literal: true

package_name = 'Git'

control 'dehydrated-git-install' do
  title 'Git should be installed'

  describe package(package_name) do
    it { should be_installed }
  end
end
