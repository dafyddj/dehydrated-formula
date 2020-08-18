# frozen_string_literal: true

control 'dehydrated-git-install' do
  title 'Git should be installed'

  describe package(input('git_pkg_name')) do
    it { should be_installed }
  end
end
