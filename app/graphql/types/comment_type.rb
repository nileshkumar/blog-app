module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :comment, String, null: true
    field :user_id, Integer, null: false
    field :post_id, Integer, null: false
    field :emotion_id, Integer, null: true

    field :reactions, [Types::ReactionType], null: false
  end
end
