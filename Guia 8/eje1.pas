program eje1;
type
  st4=string[4];
  paciente=record
    nombre:st4;
    edad:byte;
    peso:word;
    altura:word;
  end;
  vpac=array[1..5]of paciente;
type
  normales=record
    nombre:st4;
    edad:byte;
  end;
  vnorm=array[1..5]of normales;
procedure cargavec(var vpaciente:vpac; n:byte);
var
  i:byte;
  aux:char;
begin
  for i:=1 to n do
    begin
      writeln('ingrese nombre, edad,peso, altura');
      with vpaciente[i] do
        readln(nombre,aux,edad,peso,altura);
    end;
end;
function masjoven (vpaciente:vpac; n:byte):st4;
var
  i:byte;
  min:byte;
  maisjoven:string[4];
begin
  min:=99;
  for i:=1 to n do
    begin
      if vpaciente[i].edad<min then
         begin
           min:=vpaciente[i].edad;
           maisjoven:=vpaciente[i].nombre
         end;
    end;
  masjoven:=maisjoven
end;
function promedioaltura(vpaciente:vpac; n:byte):real;
var
  i:byte;
  acum:word;
begin
  acum:=0;
  for i:=1 to n do
    acum:=acum+vpaciente[i].altura;
 promedioaltura:=(acum/n);
end;
function rangos(vpaciente:vpac; i:byte):boolean;
var
 imc:real;
begin
 imc:=(vpaciente[i].peso/((vpaciente[i].altura)*(vpaciente[i].altura)));
   if (imc>=18.5) or (imc<25) then
      rangos:=true
   else
     rangos:=false;

end;
procedure vecnor(var vectornormal:vnorm;var j:byte;vpaciente:vpac; n:byte);
var
  i:byte;
begin
    j:=0;
    for i:=1 to n do
      begin
        if (rangos(vpaciente,i))then
           begin
             j:=j+1;
             vectornormal[j].nombre:=vpaciente[i].nombre;
             vectornormal[j].edad:=vpaciente[i].edad;
           end;
      end;
end;
procedure muestranormal(vectornormal:vnorm;j:byte);
var
  i:byte;
begin
   for i:=1 to j do
     begin
       with vectornormal[i] do
         begin
           writeln(nombre);
           writeln(edad);
         end;
       writeln;
     end;
end;

var
  vectornormal:vnorm;
  vpaciente:vpac;
  n,j:byte;
begin
  writeln('cuantos pacientes son max 5');
  readln(n);
  cargavec(vpaciente,n);
  writeln('el paciente mas joven es',masjoven(vpaciente,n));
  writeln('el promedio de altura es',promedioaltura(vpaciente,n):0:2);
  vecnor(vectornormal,j,vpaciente,n);
  muestranormal(vectornormal,j);
  readln;

end.

