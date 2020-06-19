function PythonList = makeList(x)
for i= 1: length(x)
    A{i}=x{i}';
    B{i}=py.list(A{i});
end;

%B= arrayfun(@(x) py.list(x), A, 'un',0)
%A= arrayfun(@{x} x.', firstipsisite)
PythonList= py.list(B);
end
    
