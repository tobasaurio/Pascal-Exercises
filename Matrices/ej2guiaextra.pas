program ej2guiaextra;
type
  vn=array[1..10]of integer;
  mn=array[1..10,1..10]of integer;
function promedio(vector:vn):real;
var
  i:byte;
  acum:real;
begin
  acum:=0;
  for i:=1 to 4 do
    acum:=acum+vector[i];
  promedio:=(acum/4);
end;
function mayorult(vector:vn):boolean;
begin
  if (promedio(vector))> vector[5] then
    mayorult:=false
  else
    mayorult:=true;
end;
procedure cargamatriz(var matriz:mn;vector:vn;n:byte;h:byte);
var
  j:byte;
begin
    for j:=1 to 5 do
      matriz[h,j]:=vector[j];
end;
procedure muestramat(matriz:mn;h:byte);
var
  i,j:byte;
begin
  for i:=1 to h do
    begin
    for j:=1 to 5 do
      write(matriz[i,j]);
    writeln();
    end;
end;
var
  arch:text;
  vector:vn;
  matriz:mn;
  n,i,h:byte;
begin
  assign(arch,'Mayor.txt');
  reset(arch);
  readln(arch,n);
  h:=0;
  while not eof (arch) do
   begin
      for i:=1 to 5 do
          read(arch,vector[i]);
      readln(arch);
    if (mayorult(vector))then
      begin
       h:=h+1;
       cargamatriz(matriz,vector,n,h);
      end;
   end;
  muestramat(matriz,h);
  readln;
end.

