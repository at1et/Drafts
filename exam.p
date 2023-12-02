program exam;

type
	Node = record
	data: Integer;
	next, prev: ^Node;
end;

//Функция для создания нового узла
function CreateNode(value: Integer): ^Node; 
	var
		newNode: ^Node
	begin
		New(newNode);	// Выделяем память для нового узла 

		// Инициилизируем значения
		newNode^.data := value;
		newNode^.prev := nil;
		newNode^.next := nil;

		CreateNode:= newNode; // Возвращаем указатель на новый узел
	end;



// Функция для создания следующего элемента списка
procedure appendNode (var head, tail: ^Node; value: Integer);
var
	newNode: ^Node;
begin
	newNode := CreateNode(value);
	//Проверяем пуст ли список
	if head = nil then
		head := newNode
	else
		begin
			tail^.next = newNode;
			newNode^.prev := tail;
		end;
	tail := newNode; // Ообновляем хвост списка 
end;



// Функция для проверки условия
function Check(head: ^Node; n: Integer): Boolean;
	var
		current, tail: ^Node;
		i, j; Integer;		
	begin
		current := head;
		for i := 1 to n do
		begin
			//Доходим до послекднего элемента списка
			while tail^.next <> nil do
				tail := tail^.next;

			// Проверяем условие
			if current^.data <> 2 * tail^.data + (tail^.prev)^.data then
			begin
				Check := False;
				exit;
			end;
			
						
			// Переходим к следующему узлу 
			current := current^.next;
			tail := tail^.prev;
		end;
		// Если все условия верны, возвращаем true
		check := True;
	end;

var
	head, current, newNode: ^Node;tail
	n, i, ai: Integer;
begin 
	//Ввод значений  и значений a1, .. , an
	write('Введите n: ');
	readln(n);
	
for i = 1 to n do
begin
writeln('Введите значения a', i);
readln(ai)
appendNode(head, tail, ai)
end;
	
	// Проверка условия
	if Check(head, n) then
		writeln('Условие верно');
	else
		writeln('Условие неверно');

	//Освобождение памяти
	Current := head;
	while current <> nil do 
	begin
		newNode := current;
		current := current^.next;
		Dispose(newNode);
	end;
end.
