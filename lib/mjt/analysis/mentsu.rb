module Mjt
  module Analysis 
    class Mentsu
      # 面子の種類
      MENTSU_TYPE_SHUNTSU = 's'
      MENTSU_TYPE_KOUTSU  = 'k'
      MENTSU_TYPE_KANTSU  = '4'
      MENTSU_TYPE_TOITSU  = 't'
      MENTSU_TYPE_TOKUSYU = 'y'

      attr_accessor :pai_list,    # 牌(Paiクラス)のリスト
                    :mentsu_type  # 面子の種類(s:順子 k:刻子, 4:槓子, t:対子, y:特殊形)
      
      # 初期化メソッド
      def initialize(pai_list, mentsu_type)
        self.pai_list     = pai_list
        self.mentsu_type  = mentsu_type
      end
    
      # 順子かどうか
      def shuntsu?
        if self.mentsu_type == MENTSU_TYPE_SHUNTSU
          return true
        end
        return false
      end
    
      # 刻子かどうか
      def koutsu?
        if self.mentsu_type == MENTSU_TYPE_KOUTSU
          return true
        end
        return false
      end
      
      # 槓子かどうか
      def kantsu?
        if self.mentsu_type == MENTSU_TYPE_KANTSU
          return true
        end
        return false
      end
      
      # 対子かどうか
      def toitsu?
        if self.mentsu_type == MENTSU_TYPE_TOITSU
          return true
        end
        return false
      end
    
      # 特殊系かどうか
      def tokusyu?
        if self.mentsu_type == MENTSU_TYPE_TOKUSYU
          return true
        end
        return false
      end
        
      # 全ての牌が萬子か？
      def manzu?
        self.pai_list.each do |pai|
          if pai.type != Pai::PAI_TYPE_MANZU
            return false
          end
        end
        return true
      end

      # 全ての牌が筒子か？
      def pinzu?
        self.pai_list.each do |pai|
          if pai.type != Pai::PAI_TYPE_PINZU
            return false
          end
        end
        return true
      end

      # 全ての牌が索子か？
      def souzu?
        self.pai_list.each do |pai|
          if pai.type != Pai::PAI_TYPE_SOUZU
            return false
          end
        end
        return true
      end

      # 全ての牌が字牌か？
      def jihai?
        self.pai_list.each do |pai|
          if pai.type != Pai::PAI_TYPE_JIHAI
            return false
          end
        end
        return true
      end
      
      # 両面待ちでのアガリ面子であるか？
      def ryanmen?
        if self.shuntsu?
          if self.pai_list[0].agari || self.pai_list[2].agari
            if ( self.pai_list[0].agari && self.pai_list[2].number!=9 ) ||
               ( self.pai_list[2].agari && self.pai_list[0].number!=1 )
              return true
            end
          end
        end
        return false
      end
      
      # 辺張待ちでのアガリ面子であるか？
      def penchan?
        if self.shuntsu?
          if ( self.pai_list[0].agari && self.pai_list[2].number==9 ) ||
             ( self.pai_list[2].agari && self.pai_list[0].number==1 )
            return true
          end
        end
        return false
      end
      
      # 嵌張待ちでのアガリ面子であるか？
      def kanchan?
        if self.shuntsu?
          if self.pai_list[1].agari
            return true
          end
        end
        return false
      end
      
      # 単騎待ちでのアガリ面子であるか？
      def tanki?
        if self.toitsu?
          if self.pai_list[0].agari && self.pai_list[1].agari
            return true
          end
        end
        return false
      end
      
      # 双ポン待ちでのアガリ面子であるか？
      def shanpon?
        if self.koutsu?
          if self.pai_list[0].agari
            return true
          end
        end
        return false
      end

=begin
      # 全ての牌が同色かつ並びになっているかどうか？(同順の条件を満たしているか？)
      def doujun?
        if ! self.jihai?
          if self.pai_list[0].type == self.pai_list[1].type && self.pai_list[0].type == self.pai_list[2].type &&
             self.pai_list[0].number == self.pai_list[1].number - 1 && self.pai_list[0].number == self.pai_list[2].number - 2
             return true
          end
        end
        return false
      end

      # 全ての牌が同色かつ同じ数字になっているかどうか？(同順の条件を満たしているか？)
      def doukou?
        if ! self.jihai?
          if self.pai_list[0].type == self.pai_list[1].type && self.pai_list[0].type == self.pai_list[2].type &&
             self.pai_list[0].number == self.pai_list[1].number - 1 && self.pai_list[0].number == self.pai_list[2].number - 2
            return true
          end
        end
        return false
      end
=end
    end
  end
end