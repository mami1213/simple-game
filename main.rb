require 'dxruby'

require_relative 'player'
require_relative 'enemy'

font = Font.new(32)
player_img = Image.load("image/player.png")
enemy_img = Image.load("image/enemy.png")
sora_img=Image.load("image/aozora.png")


player = Player.new(10, 10, player_img)

enemies = []
10.times do
  enemies << Enemy.new(rand(20..(600)), rand(20..(400)), enemy_img)
end

timer = 600 + 60 # 追加
Window.loop do
  Window.draw(0,5, sora_img)
  Window.draw_font(250,200, "push space!!", font)
   if Input.keyPush?(K_SPACE)
     break
   end
end
Window.loop do
 
      Window.draw(0,5, sora_img)
            if timer >= 60 # 追加
                timer -= 1 # 追加
                player.update
                t=rand(0..9)
                u=rand(0..9)
                vx=rand(-100..100)
                vy=rand(-100..100)
                enemies[t].x+=vx
                enemies[u].y+=vy
                  if enemies[t].x<=20||enemies[t].x>=600
                    enemies[t].x-=vx
                  end
  
                   if  enemies[u].y<=20 || enemies[u].y>=400
                      enemies[u].y-=vy
                    end
              end

        player.draw


         Sprite.draw(enemies)
        Window.draw_font(10, 0, "スコア：#{player.score}", font)
        Window.draw_font(10, 32, "残り時間：#{timer / 60}秒", font) # 追加

         Sprite.check(player, enemies)
     
end