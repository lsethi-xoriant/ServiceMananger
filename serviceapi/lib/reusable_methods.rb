
  module ReusableMethods
    def checking_ids(arrDb,arrParam)
        isExist=false
        arrParam.each do |v|
          isExist=false
          arrDb.each do |base|
            if v == base
              isExist = true
              break
            end
          end

          if !isExist
            raise CanCan::AccessDenied.new("One of the Stores Ids is not yours")
          end
        end
        return isExist
    end


    def check_permissions(params)
      if [1,2].any? {|n| params.include? n }
        render json:{message: "Illegal permission for adding to a group"},status: 403
      end
    end

  end
