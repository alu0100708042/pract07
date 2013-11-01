require "rspec"
require "racional"

describe Racional do
	
	# Se ejecuta antes de cada prueba.
	before :each do
		@racionalA = Racional.new(1,5)		
		@racionalB = Racional.new(3,9)		
	end
	
	it "Comprobar si existe numerador" do
		@racionalA.num.should == 1
	end

	it "Comprobar si existe denominador" do
		@racionalB.denom.should == 3
	end
	
	it "Combrobar el metodo to_s" do
		@racionalA.to_s.should == "1/5"
	end
	
	it "Comprobar la llamada a la funcion num" do
		@racionalA.respond_to?("num").should == true
	end

	it "Comprobar la llamada a la funcion denom" do
		@racionalB.respond_to?("denom").should == true
	end
	
	it "Comprobar que este en forma reducida" do
		@racionalB.to_s.should == Racional.new(1,3).to_s
	end
	
	it "Comprobar el formato flotante" do
		@racionalA.to_f.should == 1.to_f/5.to_f
	end

	it "Comparar si dos fracciones son iguales" do
		@racionalA.should == Racional.new(10, 50)
	end

	it "Comprobar el valor absoluto con el metodo abs" do
		Racional.new(-1,5).abs.should == @racionalA
	end
	
	it "Comprobar el reciproco de una fraccion" do
		@racionalA.reciprocal.should == Racional.new(5,1)
	end
	
	it "Comprobar el opuesto de una fraccion" do
		(-@racionalA).should == Racional.new(-5,1)
	end

	it "Comprobar la suma de dos fracciones" do
		(@racionalA + @racionalB).should == Racional.new(8,15)
	end

	it "Comprobar la resta de dos fracciones" do
		Racional.new(-2,15).should == (@racionalA - @racionalB)
	end

	it "Comprobar la multiplicacion de dos fracciones" do
		Racional.new(1,15).should == (@racionalA * @racionalB)
	end

	it "Comprobar la division de dos fracciones" do
		Racional.new(3,5).should == (@racionalA / @racionalB)
	end

	it "Comprobar el resto dos fracciones" do
		(@racionalA % @racionalB).should == Racional.new(1,1)
	end

	it "Comprobar si una fracion es menor que otra" do
		(@racionalA < @racionalB).should == true
	end

	it "Comprobar si una fracion es mayor que otra" do
		(@racionalA > @racionalB).should == false
	end

	it "Comprobar si una fracion es menor o igual que otra" do
		(@racionalA <= Racional.new(1,5)).should == true
	end

	it "Comprobar si una fracion es mayor o igual que otra" do
		(@racionalA >= @racionalB).should == false
	end
	
end
