﻿//This product contains parts of asserts, which is licensed under the Apache License,
//Version 2.0.
//The license can be downloaded from
//http://www.apache.org/licenses/LICENSE-2.0.html.
//The source code for this software is available from
//https://github.com/oscript-library/asserts.
//
// Modifications:
// Added &AtClient directives to all methods and variables. Nikita Gryzlov <nixel2007@gmail.com>
//

&НаКлиенте
Перем ПроверяемоеЗначение;
&НаКлиенте
Перем ИмяМетода;
&НаКлиенте
Перем ПараметрыМетода;
&НаКлиенте
Перем ДопСообщениеОшибки;
&НаКлиенте
Перем ФлагОтрицания;
&НаКлиенте
Перем ФлагОтрицанияДляСообщения;
&НаКлиенте
Перем СтатусыРезультатаТестирования;

&НаКлиенте
Функция Что(Знач ПроверяемоеЗначениеПараметр, Знач Сообщение = "") Экспорт
	ПроверяемоеЗначение = ПроверяемоеЗначениеПараметр;
	ДопСообщениеОшибки = Сообщение;
	ФлагОтрицания = Ложь;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция Не_() Экспорт
	ФлагОтрицания = Истина;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция ЭтоНе() Экспорт
	Возврат Не_();
КонецФункции

&НаКлиенте
Функция Метод(Знач ИмяМетодаПараметр, Знач ПараметрыМетодаПараметр = Неопределено) Экспорт
	ИмяМетода = ИмяМетодаПараметр;
	Если ПараметрыМетодаПараметр = Неопределено Тогда
		ПараметрыМетода = Новый Массив;
	Иначе
		ПараметрыМетода = ПараметрыМетодаПараметр;
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция ЭтоИстина() Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение = Истина) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Формат(ПроверяемоеЗначение, "БЛ=Ложь; БИ=Истина"), "является ИСТИНОЙ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция ЕстьИстина() Экспорт
	Возврат ЭтоИстина();
КонецФункции

&НаКлиенте
Функция ЭтоЛожь() Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение = Ложь) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(Формат(ПроверяемоеЗначение, "БЛ=Ложь; БИ=Истина"), "является ЛОЖЬЮ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция ЕстьЛожь() Экспорт
	Возврат ЭтоЛожь();
КонецФункции

&НаКлиенте
Функция Равно(Знач ОжидаемоеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение = ОжидаемоеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "РАВНО (" + ОжидаемоеЗначение + ").");
		Если ТипЗнч(ПроверяемоеЗначение) <> ТипЗнч(ОжидаемоеЗначение) Тогда
			СообщениеОшибки = СообщениеОшибки + СтрШаблон("%3 Тип проверяемого значения (%1) НЕ РАВЕН  типу ожидаемого значения (%2).",
			ТипЗнч(ПроверяемоеЗначение), ТипЗнч(ОжидаемоеЗначение), Символы.ПС);
		КонецЕсли;
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция Больше(Знач МеньшееЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение > МеньшееЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БОЛЬШЕ (" + МеньшееЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция БольшеИлиРавно(Знач МеньшееИлиРавноеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение >= МеньшееИлиРавноеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "БОЛЬШЕ ИЛИ РАВНО (" + МеньшееИлиРавноеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция Минимум(Знач МинимальноеЗначение) Экспорт
	Возврат БольшеИлиРавно(МинимальноеЗначение);
КонецФункции

&НаКлиенте
Функция МеньшеИлиРавно(Знач БольшееИлиРавноеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение <= БольшееИлиРавноеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "МЕНЬШЕ ИЛИ РАВНО (" + БольшееИлиРавноеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция Максимум(Знач МаксимальноеЗначение) Экспорт
	Возврат МеньшеИлиРавно(МаксимальноеЗначение);
КонецФункции

&НаКлиенте
Функция Меньше(Знач БольшееЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение < БольшееЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "МЕНЬШЕ (" + БольшееЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция Заполнено() Экспорт
	Если Не ЛогическоеВыражениеВерно(ЗначениеЗаполнено(ПроверяемоеЗначение)) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "является ЗАПОЛНЕННЫМ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция Существует() Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение <> Неопределено И ПроверяемоеЗначение <> Null) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "СУЩЕСТВУЕТ.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция ЭтоНеопределено() Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение = Неопределено) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "является НЕОПРЕДЕЛЕНО.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция ЕстьНеопределено() Экспорт
	Возврат ЭтоНеопределено();
КонецФункции

&НаКлиенте
Функция ЭтоNull() Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение = Null) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "является NULL.");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция ЕстьNull() Экспорт
	Возврат ЭтоNull();
КонецФункции

&НаКлиенте
Функция ИмеетТип(Знач ТипИлиИмяТипа) Экспорт
	ОжидаемыйТип = ?(ТипЗнч(ТипИлиИмяТипа) = Тип("Строка"), Тип(ТипИлиИмяТипа), ТипИлиИмяТипа);
	ТипПроверяемогоЗначения = ТипЗнч(ПроверяемоеЗначение);
	Если Не ЛогическоеВыражениеВерно(ТипПроверяемогоЗначения = ОжидаемыйТип) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке("тип - " + ТипПроверяемогоЗначения, "имеет тип (" + ОжидаемыйТип + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция Между(Знач НачальноеЗначение, Знач КонечноеЗначение) Экспорт
	Если Не ЛогическоеВыражениеВерно(ПроверяемоеЗначение >= НачальноеЗначение И ПроверяемоеЗначение <= КонечноеЗначение) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "МЕЖДУ (" + НачальноеЗначение + ") и (" + КонечноеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция Содержит(Знач ИскомоеЗначение) Экспорт
	Перем ИскомоеЗначениеНайдено;
	
	ТипПроверяемоегоЗначения = ТипЗнч(ПроверяемоеЗначение);
	Если ТипПроверяемоегоЗначения = Тип("Строка") Тогда
		ИскомоеЗначениеНайдено = Найти(ПроверяемоеЗначение, ИскомоеЗначение) > 0;
	ИначеЕсли ТипПроверяемоегоЗначения = Тип("Массив") Тогда
		ИскомоеЗначениеНайдено = ПроверяемоеЗначение.Найти(ИскомоеЗначение) <> Неопределено;
	ИначеЕсли ТипПроверяемоегоЗначения = Тип("Структура")
		Или ТипПроверяемоегоЗначения = Тип("Соответствие") Тогда
		Для каждого КлючЗначение Из ПроверяемоеЗначение Цикл
			ИскомоеЗначениеНайдено = КлючЗначение.Значение = ИскомоеЗначение;
			Если ИскомоеЗначениеНайдено Тогда
				Прервать;
			КонецЕсли;
		КонецЦикла;
	ИначеЕсли ТипПроверяемоегоЗначения = Тип("СписокЗначений") Тогда
		ИскомоеЗначениеНайдено = ПроверяемоеЗначение.НайтиПоЗначению(ИскомоеЗначение) <> Неопределено;
	КонецЕсли;
	
	Если ИскомоеЗначениеНайдено = Неопределено Тогда
		СообщениеОшибки = "Утверждение ""Содержит"" не умеет работать с типом <" + ТипПроверяемоегоЗначения + ">." + ФорматДСО(ДопСообщениеОшибки);
		ВызватьИсключение СообщениеОшибки;
	КонецЕсли;
	
	Если Не ЛогическоеВыражениеВерно(ИскомоеЗначениеНайдено) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке(ПроверяемоеЗначение, "СОДЕРЖИТ (" + ИскомоеЗначение + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция ИмеетДлину(Знач ОжидаемаяДлина) Экспорт
	Перем ФактическаяДлина;
	
	ТипПроверяемоегоЗначения = ТипЗнч(ПроверяемоеЗначение);
	Если ТипПроверяемоегоЗначения = Тип("Строка") Тогда
		ФактическаяДлина = СтрДлина(ПроверяемоеЗначение);
	Иначе
		Попытка
			ФактическаяДлина = ПроверяемоеЗначение.Количество();
		Исключение
			ФактическаяДлина = Неопределено;
		КонецПопытки;
	КонецЕсли;
	
	Если ФактическаяДлина = Неопределено Тогда
		СообщениеОшибки = "Утверждение ""ИмеетДлину"" не умеет работать с типом <" + ТипПроверяемоегоЗначения + ">." + ФорматДСО(ДопСообщениеОшибки);
		ВызватьИсключение СообщениеОшибки;
	КонецЕсли;
	
	Если Не ЛогическоеВыражениеВерно(ФактическаяДлина = ОжидаемаяДлина) Тогда
		СообщениеОшибки = СформироватьСообщениеОбОшибке("<" +ПроверяемоеЗначение + "> с длиной " + ФактическаяДлина, "ИМЕЕТ ДЛИНУ (" + ОжидаемаяДлина + ").");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

&НаКлиенте
Функция ВыбрасываетИсключение(Знач ФрагментИсключения = "") Экспорт
	Контекст = ПроверяемоеЗначение;
	ИсключениеВозникло = Ложь;
	
	Попытка
		СтрокаВыполнения = СтрШаблон("%1.%2(%3)", Контекст, ИмяМетода, ПараметрыМетода);
		Выполнить(СтрокаВыполнения);
	Исключение
		ИсключениеВозникло = Истина;
		ТекстИсключения = ОписаниеОшибки();
	КонецПопытки;
	
	Если Не ЛогическоеВыражениеВерно(ИсключениеВозникло И Найти(ТекстИсключения, ФрагментИсключения) > 0) Тогда
		СообщениеОшибки = "Ожидали, что " + ИмяМетода
		+ ?(ФлагОтрицания, " НЕ ", " ")
		+ "ВЫБРОСИТ ИСКЛЮЧЕНИЕ"
		+ ?(ЗначениеЗаполнено(ФрагментИсключения), " СОДЕРЖАЩЕЕ ТЕКСТ <" + ФрагментИсключения + ">, а был текст <" + ТекстИсключения + ">.", "");
		ВызватьОшибкуПроверки(СообщениеОшибки);
	КонецЕсли;
	
	Возврат ЭтотОбъект;
КонецФункции

// { Helpers
&НаКлиенте
Функция ФорматДСО(Знач ДопСообщениеОшибки)
	Если ДопСообщениеОшибки = "" Тогда
		Возврат "";
	КонецЕсли;
	
	Возврат Символы.ПС + ДопСообщениеОшибки;
КонецФункции

&НаКлиенте
Процедура ВызватьОшибкуПроверки(Знач СообщениеОшибки)
	Префикс = "["+ СтатусыРезультатаТестирования.ОшибкаПроверки + "]";
	ВызватьИсключение Префикс + " " + СообщениеОшибки;
КонецПроцедуры

&НаКлиенте
Функция ЛогическоеВыражениеВерно(Знач ЛогическоеВыражение)
	Результат = ФлагОтрицания <> ЛогическоеВыражение;
	ФлагОтрицанияДляСообщения = ФлагОтрицания;
	ФлагОтрицания = Ложь;
	
	Возврат Результат;
КонецФункции

&НаКлиенте
Функция СформироватьСообщениеОбОшибке(Знач ПроверяемоеЗначение, Знач Ожидание)
	Возврат "Ожидали, что проверяемое значение (" + ПроверяемоеЗначение + ")" + ?(ФлагОтрицанияДляСообщения, " НЕ ", " ") + Ожидание + ФорматДСО(ДопСообщениеОшибки);
КонецФункции
// } Helpers

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	СтатусыРезультатаТестирования = Новый Структура;
	СтатусыРезультатаТестирования.Вставить("ОшибкаПроверки", "Failed");
	СтатусыРезультатаТестирования.Вставить("НеизвестнаяОшибка", "Broken");
	СтатусыРезультатаТестирования.Вставить("ТестПропущен", "Pending");
	
	ФлагОтрицания = Ложь;
	
EndProcedure

