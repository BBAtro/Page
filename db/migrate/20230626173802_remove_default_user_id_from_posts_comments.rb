class RemoveDefaultUserIdFromPostsComments < ActiveRecord::Migration[7.0]
  def up #метод который применяется при применении миграции 
    change_column_default :posts, :user_id, from: User.first.id, to: nil
    change_column_default :comments, :user_id, from: User.first.id, to: nil
  end

  def down #метод который применяется при откате миграции 
    change_column_default :posts, :user_id, from: nil, to: User.first.id
    change_column_default :comments, :user_id, from: nil, to: User.first.id
  end
end
