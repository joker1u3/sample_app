require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
    # 这行代码不符合常见做法  推断按照面向对象的思维应该在user模型中添加add_micropost方法
    # @micropost = Micropost.new(content: "Lorem ipsum", user_id: @user.id)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  test "should be vaild" do 
    assert @micropost.valid?
  end

  test "user id should be present " do 
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present " do 
    @micropost.content = "  "
    assert_not @micropost.valid?
  end

  test "content should be at most 140 charachters " do 
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "order should be recent first" do 
    assert_equal Micropost.first, microposts(:most_recent)
  end
  
end
