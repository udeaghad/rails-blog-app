require_relative '../rails_helper'

RSpec.describe User, type: :model do
  context 'test User class' do
    subject { User.new(name: 'James Rock', photo: 'https:...', bio: 'I am a Teacher') }

    before { subject.save }

    it 'name must not be blank.' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should greater than or equal to zero' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should greater than or equal to zero' do
      subject.posts_counter = -3
      expect(subject).to_not be_valid
    end

    it 'posts_counter should greater than or equal to zero' do
      subject.posts_counter = 'string'
      expect(subject).to_not be_valid
    end
  end
end
