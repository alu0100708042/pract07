
# creando getters  para comprobar la prueba
require 'gcd'

class Racional
	include Comparable
	include Enumerable
	attr_reader :num, :denom
	def initialize (num,denom)
	# se llama al maximo comun divisor para reducir la funcion dividiendo entre ese numero
		reducir = gcd(num, denom)
		@num = num/reducir
		@denom = denom/reducir
	end
	
	def to_s
		"#{num}/#{denom}"
	end
	# se utiliza para mostrar en formato flotante 
	def to_f
		num.to_f/denom
	end
	# comprueba si dos numeros son iguales
	def ==(other)
		# verifica que el segundo argumento sea de la clase racional
		if other.instance_of? Racional
			@num == other.num && @denom == other.denom
		else
			false
		end
	end

	#calcular el valor absoluto de una fraccion con el metodo abs
	def abs
		Racional.new(num.abs, denom.abs)
	end
	
	#calcular el reciproco de una fraccion con el metodo reciprocal
	def reciprocal
		Racional.new(denom, num)
	end

	#calcular el opuesto de una fraccion con -
	def -@
		Racional.new(-denom, num)	
	end
	
	#suma dos fracciones con + y dar el resultado de forma reducida
	def +(other)
		Racional.new(num*other.denom + other.num*denom, denom*other.denom)
	end
	
	#resta dos fracciones con - y dar el resultado de forma reducida
	def -(other)
		Racional.new(num*other.denom - other.num*denom, denom*other.denom)
	end
	
	#multiplica dos fracciones con * y dar el resultado de forma reducida
	def *(other)
		Racional.new(num*other.num,denom*other.denom)
	end
	
	#  divide dos fracciones con / y dar el resultado de forma reducida
	def /(other)
		Racional.new(num*other.denom,denom*other.num)
	end
	
	
	#  calcula el resto dos fracciones con % y dar el resultado de forma reducida
	def %(other)
		Racional.new(num%denom, other.num%other.denom)
	end
	
	# comprobamos si la otra fraccion pertenece a la clase e implementamos con el operador <=> del modulo comparable que nos permite ver si es mayor igual o menor o mayor ...
	def <=>(other)
		return nil unless other.instance_of? Racional
		(num.to_f / denom) <=> (other.num.to_f / other.denom)
	end
end
