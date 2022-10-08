# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Blogs API' do
  # path '/blogs' do

  #   post 'Creates a blog' do
  #     tags 'Blogs'
  #     consumes 'application/json'
  #     parameter name: :blog, in: :body, schema: {
  #       type: :object,
  #       properties: {
  #         title: { type: :string },
  #         content: { type: :string }
  #       },
  #       required: [ 'title', 'content' ]
  #     }

  #     response '201', 'blog created' do
  #       let(:blog) { { title: 'foo', content: 'bar' } }
  #       run_test!
  #     end

  #     response '422', 'invalid request' do
  #       let(:blog) { { title: 'foo' } }
  #       run_test!
  #     end
  #   end
  # end

  path '/api/v1/users/{id}/posts' do
    get 'Retrieves a post' do
      tags 'Posts'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'post found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :text }
               },
               required: %w[id title text]

        let(:id) { Post.create(title: 'foo', text: 'bar').id }
        run_test!
      end

      response '404', 'post not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}/posts/{id}/comments' do
    get 'Retrieves a comment by a user' do
      tags 'Comments'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'post found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },

                 text: { type: :text }
               },
               required: %w[id text]

        let(:id) { Comment.create(text: 'bar').id }
        run_test!
      end

      response '404', 'post not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
