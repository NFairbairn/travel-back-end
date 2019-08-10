class AddUriToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :uri, :string
  end
end
