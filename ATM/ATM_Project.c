#include<stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <conio.h>
#include <time.h>
#include <iostream>
#include <Windows.h>
#include <dos.h>

char * showtime()
{
	time_t timer = time(NULL);
	return ctime(&timer);//
}//showtime

void delay(unsigned int mseconds)
{
	clock_t goal = mseconds + clock();
	while (goal>clock());
}//delay

struct transaction
{
	char date[40];
	long long int money;
	char type[20];
};
struct Card
{
	long long int Accounts;
	int CardNo;
	int Pass;
	char Name[51];
	struct transaction date1[20];
	int ctr;
};//moarefi record
struct Card blank = { 0, 0, 0, "", { "", 0, "" }, 0 };

void mainmenu1();
void Showinformation(int CardNo);
void ReceiveMoney(int CardNo);
void SettleMoney(int CardNo);
void ChangePass(int CardNo);
void ShiftCardtoCard(int CardNo);
void RecentActiviteis(int CardNo);
void mainmenu2(int CardNo);
void checkaccount();
void NewCard();


int main()
{

	system("color E");
	FILE *ptr;
	ptr = fopen("project.txt", "r+");
	int i;
	if (ptr == NULL)
	{
		puts("Unable to find the file");
		return 0;
	}
	/*for(i=1000;i<=9999;i++)
	{
		fwrite(&blank,sizeof(struct Card),1,ptr);
	}*/
	mainmenu1();
	system("cls");
	fclose(ptr);
	return 0;
}//main

void mainmenu1()
{
	puts("\n\t\tWelcome to our ATM\n");
	FILE *ptr = fopen("project.txt", "r+");
	int x;
	printf("\t\t1:New Card\n\n");
	Sleep(300);
	printf("\t\t2:Enter Card\n\n");
	Sleep(300);
	printf("\t\t3:Delete whole data\n\n");
	Sleep(300);
	printf("\t\t4:Exit\n\n");
	Sleep(1000);
	printf("\t\tPlease enter a number:\t");
	scanf("%d", &x);
	system("cls");
	if (x == 1)
		NewCard();
	else if (x == 2)
		checkaccount();
	else if (x == 3)
	{
		printf("\n\t\tNow,We claer everything");
		Sleep(1000);
		ptr = fopen("project.txt", "w+");
		ptr = fopen("project.txt", "r+");
		fclose(ptr);
	}
	else if (x == 4)
	{
		system("cls");
		puts("\n\t\tThanks for your coming..Have a nice day\t:)");
		Sleep(1000);
		printf("\n\n\n\t\tCreated by:Maedeh shamirzaei\n\n");
		Sleep(1000);
		printf("\n\n\t\tPress any key to close.\t");
		Sleep(2000);
		fclose(ptr);
	}
	else
	{
		puts("\n\t\tYour choice should be between 1 and 4");
		Sleep(500);
		puts("\n\n\t\tPlease press any key to return to previous menu.\t");
		getch();
		system("cls");
		mainmenu1();
	}
}//main menu 1

void mainmenu2(int CardNo)
{
	printf("\n\t\tHi dear %s.\t:)\n\n", blank.Name);
	int x;
	printf("\t\t1:Show information\n\n");
	Sleep(500);
	printf("\t\t2:Receive Money\n\n");
	Sleep(500);
	printf("\t\t3:Settle Money\n\n");
	Sleep(500);
	printf("\t\t4:Change Pass\n\n");
	Sleep(500);
	printf("\t\t5:Shift card to card\n\n");
	Sleep(500);
	printf("\t\t6:Recent Activiteis\n\n");
	Sleep(500);
	printf("\t\t7:Exit\n\n");
	delay(1000);
	printf("\t\tplease do a selection:\t");
	scanf("%d", &x);
	system("cls");
	if (x == 1)
		Showinformation(CardNo);
	else if (x == 2)
		ReceiveMoney(CardNo);
	else if (x == 3)
		SettleMoney(CardNo);
	else if (x == 4)
		ChangePass(CardNo);
	else if (x == 5)
		ShiftCardtoCard(CardNo);
	else if (x == 6)
		RecentActiviteis(CardNo);
	else if (x == 7)
		mainmenu1();
	else
	{
		puts("Sorry..Your choice should be between 1 and 7");
		Sleep(1000);
		mainmenu2(CardNo);
	}
}//menoye 7 gane

void NewCard()
{
	system("cls");
	FILE *ptr = fopen("project.txt", "r+");
	int Pass, CardNo;
	printf("\n\n\t\tPlease enter your CardNo (4 digits):\t");
	scanf("%d", &CardNo);
	if (!(CardNo >= 1000 && CardNo <= 9999))
	{
		printf("\n\n\n\t\tError...your CardNo should be 4 digits.\n\n");
		delay(1000);
		puts("\t\tPlease press any key to return to previous menu.\n\t");
		getch();
		Sleep(500);
		system("cls");
		mainmenu1();
	}
	else
	{
		fseek(ptr, sizeof(struct Card)*(CardNo - 999), SEEK_SET);
		fread(&blank, sizeof(struct Card), 1, ptr);
		if (blank.CardNo != 0/*blank.Pass==0 && blank.Name==NULL*/)
		{
			printf("\n\n\t\tSorry,We had  This CardNo before you..\n");
			delay(1000);
			puts("\n\t\tPlease press any key to return to previous menu.\n\t");
			getch();
			Sleep(500);
			system("cls");
			mainmenu1();
		}//shomare kart tekrari ast

		else
		{
			blank.CardNo = CardNo;
			printf("\n\n\t\tPlease enter your Pass(2 digits) :\t");
			scanf("%d", &Pass);
			if (!(Pass >= 10 && Pass <= 99))
			{
				printf("\n\n\t\tError...your Pass should be 2 digits..\n");
				delay(1000);
				printf("\n\t\tPlease press any key to return to previous menu.");
				getch();
				Sleep(500);
				system("cls");
				mainmenu1();
			}
			else
			{
				blank.Pass = Pass;
				printf("\n\n\t\tPlease enter your Name:\t\t");
				scanf("%s", blank.Name);
				printf("\n\n\t\tPlease enter your Account:\t");
				scanf("%lld", &blank.Accounts);
				fseek(ptr, (CardNo - 999)*sizeof(struct Card), SEEK_SET);
				fwrite(&blank, sizeof(struct Card), 1, ptr);
				fclose(ptr);
				system("cls");
				printf("\n\n\n\n\t\tYour new Account was successfully created.\n\n");
				printf("\t\tCardNO:\t%d\n\t\tPass:\t%d\n\t\tName:\t%s\n\t\tAccount:%lld\n\n", blank.CardNo, blank.Pass, blank.Name, blank.Accounts);
				delay(1000);
				puts("\n\t\tPress any key to return to previous menu.");
				getch();
				Sleep(1000);
				system("cls");
				mainmenu1();
			}
		}
	}
}//New record

void Showinformation(int CardNo)
{
	FILE *ptr;
	ptr = fopen("project.txt", "r+");
	fseek(ptr, sizeof(struct Card)*(CardNo - 999), SEEK_SET);
	fread(&blank, sizeof(struct Card), 1, ptr);
	printf("\n\t\tHere is your information:\n\n");
	printf("\t\tCardNo:\t%d\n\t\tPass:\t%d\n\t\tName:\t%s\n\t\tAccount:%d\n\n", blank.CardNo, blank.Pass, blank.Name, blank.Accounts);
	delay(1000);
	puts("\n\t\tPress any key to return to previous menu.");
	getch();
	Sleep(500);
	system("cls");
	fclose(ptr);
	mainmenu2(CardNo);
	
}//show information

void ReceiveMoney(int CardNo)
{

	FILE *ptr = fopen("project.txt", "r+");
	long long int money;
	char confirm;
	printf("\n\t\tplease enter your apply cost:\t");
	scanf("%lld", &money);
	fseek(ptr, (CardNo - 999)*sizeof(struct Card), SEEK_SET);
	fread(&blank, sizeof(struct Card), 1, ptr);
	if (money>blank.Accounts)
	{
		system("cls");
		printf("\n\t\tSorry.You have only %d rials in your card.\n", blank.Accounts);
		Sleep(500);
		puts("\n\n\t\tPress any key to return to previous menu.\t");
		getch();
		Sleep(500);
		system("cls");
		mainmenu2(CardNo);
	}
	else if (money>2, 000, 000)
	{
		system("cls");
		printf("\n\t\tSorry.You can't remove money more than 2,000,000 rials.\n");
		puts("\n\n\t\tPress any key to return to previous menu");
		getch();
		Sleep(500);
		system("cls");
		mainmenu2(CardNo);
	}
	else//hame chi baraye bardasht ok!!!
	{
		system("cls");
		printf("\n\t\tapply cost:%lld\n\n", money);//shorooee taid
		Sleep(500);
		printf("\t\tAre you sure?\n\t\tYes='Y'\n\t\tNo='N'\n");
		getchar();
		scanf("\t\t%c", &confirm);
		if (confirm == 'Y')
		{
			time_t timer = time(NULL);
			system("cls");
			blank.Accounts = blank.Accounts - money;
			blank.date1[blank.ctr].money = money;
			strcpy(blank.date1[blank.ctr].type, "apply");
			strcpy(blank.date1[blank.ctr].date, ctime(&timer));//time daghigh
			blank.ctr++;
			fseek(ptr, (CardNo - 999)*sizeof(struct Card), SEEK_SET);
			fwrite(&blank, sizeof(struct Card), 1, ptr);
			fclose(ptr);
			printf("\n\t\tEnd of transaction.\n\n");
			printf("\t\tapply cost:%lld\n\n", money);
			printf("\t\tNew Account:%lld\n", blank.Accounts);
			Sleep(500);
			puts("\n\n\t\tPress any key to return to previous menu.");
			getch();
			Sleep(500);
			system("cls");
			mainmenu2(CardNo);
			//bardasht anjam shod
		}
		else if (confirm == 'N')//confirm=No
		{
			system("cls");
			printf("\n\t\tApply operation cancled.\n");
			Sleep(500);
			puts("\n\n\t\tPress any key to return to previous menu.");
			getch();
			Sleep(500);
			system("cls");
			mainmenu2(CardNo);
		}
		else
		{
			while (1)
			{
				system("cls");
				printf("\n\t\tSorry..Your choice should be N or Y.\n\n\t\tTry again.\t");
				scanf("\t%c", &confirm);
				if (confirm == 'Y' || confirm == 'N')
					break;
				else
					continue;
			}
			if (confirm == 'Y')
			{
				system("cls");
				blank.Accounts = blank.Accounts - money;
				blank.date1[blank.ctr].money = money;
				strcpy(blank.date1[blank.ctr].type, "apply");
				time_t timer = time(NULL);
				strcpy(blank.date1[blank.ctr].date, ctime(&timer));//time daghigh
				blank.ctr++;
				fseek(ptr, (CardNo - 999)*sizeof(struct Card), SEEK_SET);
				fwrite(&blank, sizeof(struct Card), 1, ptr);
				fclose(ptr);
				printf("\n\t\tEnd of transaction.\n\n");
				printf("\t\tapply cost:%lld\n\n", money);
				printf("\t\tNew Account:%lld\n", blank.Accounts);
				Sleep(500);
				puts("\n\n\t\tPress any key to return to previous menu.");
				getch();
				Sleep(500);
				system("cls");
				mainmenu2(CardNo);
				//bardasht anjam shod
			}
			else if (confirm == 'N')//confirm=No
			{
				system("cls");
				printf("\n\t\tApply operation cancled.\n");
				Sleep(500);
				puts("\n\n\t\tPress any key to return to previous menu.");
				getch();
				Sleep(500);
				system("cls");
				mainmenu2(CardNo);
			}
		}
	}//bardasht ok//else
}//End of bardasht

void SettleMoney(int CardNo)
{
	FILE *ptr = fopen("project.txt", "r+");
	char confirm;
	long long int money;
	printf("\n\t\tplease enter your settle cost:\n");
	scanf("%lld", &money);
	system("cls");
	fseek(ptr, (CardNo - 999)*sizeof(struct Card), SEEK_SET);
	fread(&blank, sizeof(struct Card), 1, ptr);
	if (money>30, 000, 000)
	{
		printf("\n\t\tSorry.You can't settle money more than 30,000,000 rials.\n");
		Sleep(500);
		puts("\n\n\t\tPress any key to return to previous menu");
		getch();
		Sleep(500);
		system("cls");
		mainmenu2(CardNo);
	}
	else//hame chi baraye variz ok!!!
	{
		system("cls");
		printf("\n\t\tsettle cost:%lld\n\n", money);//shorooee taid
		printf("\n\t\tAre you sure?\nYes='Y'\nNo='N'\n");
		getchar();
		scanf("%c", &confirm);
		if (confirm == 'Y')
		{
			system("cls");
			blank.Accounts = blank.Accounts + money;
			blank.date1[blank.ctr].money = money;
			strcpy(blank.date1[blank.ctr].type, "settle");
			time_t timer = time(NULL);
			strcpy(blank.date1[blank.ctr].date, ctime(&timer));//time daghigh
			blank.ctr++;
			fseek(ptr, (CardNo - 999)*sizeof(struct Card), SEEK_SET);
			fwrite(&blank, sizeof(struct Card), 1, ptr);
			fclose(ptr);
			printf("\n\t\tEnd of transaction.\n\n");
			Sleep(500);
			printf("\n\t\tsettle cost:%lld\n\n", money);
			printf("\n\t\tNew Account:%lld\n\n", blank.Accounts);
			Sleep(500);
			puts("\n\n\t\tPress any key to return to previous menu.");
			getch();
			Sleep(500);
			system("cls");
			mainmenu2(CardNo);

			//system("cls");

			//variz  dar file save shavad
		}
		else if (confirm == 'N')//confirm=No
		{
			puts("\n\t\tSettlement cancled.");
			Sleep(500);
			puts("\n\n\t\tPress any key to return to previous menu.");
			getch();
			Sleep(500);
			system("cls");
			mainmenu2(CardNo);
		}
		else
		{
			while (1)
			{
				system("cls");
				printf("\n\t\tSorry..Your choice should be N or Y.\n\n\t\tTry again.\t");
				scanf("\t%c", &confirm);
				if (confirm == 'Y' || confirm == 'N')
					break;
				else
					continue;
			}
			if (confirm == 'Y')
			{
				system("cls");
				blank.Accounts = blank.Accounts + money;
				blank.date1[blank.ctr].money = money;
				strcpy(blank.date1[blank.ctr].type, "settle");
				time_t timer = time(NULL);
				strcpy(blank.date1[blank.ctr].date, ctime(&timer));//time daghigh
				blank.ctr++;
				fseek(ptr, (CardNo - 999)*sizeof(struct Card), SEEK_SET);
				fwrite(&blank, sizeof(struct Card), 1, ptr);
				fclose(ptr);
				printf("\n\t\tEnd of transaction.\n\n");
				Sleep(500);
				printf("\n\t\tsettle cost:%lld\n\n", money);
				printf("\n\t\tNew Account:%lld\n", blank.Accounts);
				Sleep(500);
				puts("\n\n\t\tPress any key to return to previous menu.");
				getch();
				Sleep(500);
				system("cls");
				mainmenu2(CardNo);

				//system("cls");

				//variz  dar file save shavad
			}
			else if (confirm == 'N')//confirm=No
			{
				puts("\n\t\tSettlement cancled.");
				Sleep(500);
				puts("\n\n\t\tPress any key to return to previous menu.");
				getch();
				Sleep(500);
				system("cls");
				mainmenu2(CardNo);
			}

		}
	}//bardasht ok//else
}//End of variz

void ChangePass(int CardNo)
{
	FILE *ptr = fopen("project.txt", "r+");
	int currentPass, NewPass1, NewPass2;
	system("cls");
	printf("\n\t\tplease enter your current Pass:\t");
	scanf("%d", &currentPass);
	system("cls");
	fseek(ptr, (CardNo - 999)*sizeof(struct Card), SEEK_SET);
	fread(&blank, sizeof(struct Card), 1, ptr);
	if (currentPass != blank.Pass)
	{
		printf("\n\t\tSorry..Your pass and your current pass aren't equal..\n");
		Sleep(500);
		puts("\n\n\t\tPress any key to return to previous menu.");
		getch();
		Sleep(500);
		system("cls");
		mainmenu2(CardNo);
	}
	else if (currentPass == blank.Pass)
	{
		printf("\n\t\tplease enter your new Pass:\t");
		scanf("%d", &NewPass1);
		if (NewPass1 >= 10 && NewPass1 <= 99)
		{
			system("cls");
			printf("\n\t\tplease enter your new Pass again:\t");
			scanf("%d", &NewPass2);
			if (NewPass1 == NewPass2)
			{
				blank.Pass = NewPass1;
				fseek(ptr, (CardNo - 999)*sizeof(struct Card), SEEK_SET);
				fwrite(&blank, sizeof(struct Card), 1, ptr);
				system("cls");
				printf("\n\t\tYour Pass was successfully changed..\n");
				fclose(ptr);
				Sleep(500);
				puts("\n\n\t\tPress any key to return to previous menu.");
				getch();
				Sleep(500);
				system("cls");
				mainmenu2(CardNo);
			}

			else
			{
				system("cls");
				printf("\n\t\tSorry..Maching wasn't done.\n");
				Sleep(500);
				puts("\n\n\t\tPress any key to return to previous menu");
				getch();
				Sleep(500);
				system("cls");
				mainmenu2(CardNo);
			}//mosavi naboodane 2 pass
		}//2 digit ast

		else//2 digit nist
		{
			printf("\n\t\tSorry.Your pass should be 2 digits.\n");
			Sleep(500);
			puts("\n\n\t\tPress any key to return to previous menu");
			getch();
			Sleep(500);
			system("cls");
			mainmenu2(CardNo);
		}
	}//current pass doroste
}//change passs

void ShiftCardtoCard(int CardNo)
{
	FILE *ptr = fopen("project.txt", "r+");
	char date[20];
	long long int changemoney;
	int CardNo2;
	char confirm;
	system("cls");
	printf("\n\t\tPlease enter the destination CardNo:\t");
	scanf("%d", &CardNo2);
	fseek(ptr, sizeof(struct Card)*(CardNo2 - 999), SEEK_SET);
	fread(&blank, sizeof(struct Card), 1, ptr);
	if (CardNo2 == blank.CardNo)
	{
		printf("\n\t\t We found your destination card..Please enter change money:\t");
		scanf("%lld", &changemoney);
		fseek(ptr, sizeof(struct Card)*(CardNo2 - 999), SEEK_SET);
		fread(&blank, sizeof(struct Card), 1, ptr);
		if (changemoney>50000000)
		{
			printf("\n\t\tSorry..You can't move more than 50,000,000 rials.\n");
			Sleep(500);
			puts("\n\n\t\tPress any key to return to previous menu");
			getch();
			Sleep(500);
			system("cls");
			mainmenu2(CardNo);
		}
		else if (blank.Accounts - changemoney<0)
		{
			printf("\n\t\tSorry...You have only %lld rials in your account.\n", blank.Accounts);
			Sleep(500);
			puts("\n\n\t\tPress any key to return to previous menu");
			getch();
			Sleep(500);
			system("cls");
			mainmenu2(CardNo);
		}
		else//mblagh baraye variz ok
		{
			system("cls");
			printf("\n\t\tdestination cardNo:\t%d\n\t\tName:\t%s\n\t\tchange money:\t%lld\n\n\n", CardNo2, blank.Name, changemoney);
			printf("\t\tAre you sure?\n\t\tYes='Y'\n\t\tNo='N'\n");
			getchar();
			scanf("%c", &confirm);
			system("cls");
			if (confirm == 'Y')
			{
				time_t timer = time(NULL);
				fseek(ptr, sizeof(struct Card)*(CardNo2 - 999), SEEK_SET);
				fread(&blank, sizeof(struct Card), 1, ptr);
				blank.Accounts = blank.Accounts + changemoney;
				blank.date1[blank.ctr].money = changemoney;
				strcpy(blank.date1[blank.ctr].date, ctime(&timer));//time daghigh
				strcpy(blank.date1[blank.ctr].type, "settlement by card");//variz
				blank.ctr++;
				fseek(ptr, sizeof(struct Card)*(CardNo2 - 999), SEEK_SET);
				fwrite(&blank, sizeof(struct Card), 1, ptr);
				fclose(ptr);
				ptr = fopen("project.txt", "r+");
				fseek(ptr, sizeof(struct Card)*(CardNo - 999), SEEK_SET);
				fread(&blank, sizeof(struct Card), 1, ptr);
				blank.Accounts = blank.Accounts - changemoney;
				blank.date1[blank.ctr].money = changemoney;
				strcpy(blank.date1[blank.ctr].date, ctime(&timer));//time daghigh
				strcpy(blank.date1[blank.ctr].type, "apply by card");//bardasht
				blank.ctr++;
				fseek(ptr, sizeof(struct Card)*(CardNo - 999), SEEK_SET);
				fwrite(&blank, sizeof(struct Card), 1, ptr);
				fclose(ptr);
				printf("\t\tShift proccess was successfully done.\n\n");
				printf("\t\toffset CardNo:\t%d\n\n\t\tdestination CardNo:\t%d\n\n\t\tchange money:\t%lld\n", CardNo, CardNo2, changemoney);
				Sleep(2000);
				puts("\n\n\t\tPress any key to return to previous menu..");
				getch();
				Sleep(500);
				system("cls");
				mainmenu2(CardNo);
			}
			else if (confirm == 'N')//confirm=NO
			{
				system("cls");
				printf("\n\t\tShift operation cancled.\n");
				Sleep(500);
				puts("\n\n\t\tPress any key to return to previous menu.");
				getch();
				Sleep(500);
				system("cls");
				mainmenu2(CardNo);
			}//taeed nashod

			else// na N na Y
			{
				while (1)
				{
					system("cls");
					printf("\n\t\tSorry..Your choice should be N or Y.\n\n\t\tTry again.\t");
					scanf("\t%c", &confirm);
					if (confirm == 'Y' || confirm == 'N')
						break;
					else
						continue;
				}
				if (confirm == 'Y')
				{
					time_t timer = time(NULL);
					fseek(ptr, sizeof(struct Card)*(CardNo2 - 999), SEEK_SET);
					fread(&blank, sizeof(struct Card), 1, ptr);
					blank.Accounts = blank.Accounts + changemoney;
					blank.date1[blank.ctr].money = changemoney;
					strcpy(blank.date1[blank.ctr].date, ctime(&timer));//time daghigh
					strcpy(blank.date1[blank.ctr].type, "settlement by card");//variz
					blank.ctr++;
					fseek(ptr, sizeof(struct Card)*(CardNo2 - 999), SEEK_SET);
					fwrite(&blank, sizeof(struct Card), 1, ptr);
					fclose(ptr);
					ptr = fopen("project.txt", "r+");
					fseek(ptr, sizeof(struct Card)*(CardNo - 999), SEEK_SET);
					fread(&blank, sizeof(struct Card), 1, ptr);
					blank.Accounts = blank.Accounts - changemoney;
					blank.date1[blank.ctr].money = changemoney;
					strcpy(blank.date1[blank.ctr].date, ctime(&timer));//time daghigh
					strcpy(blank.date1[blank.ctr].type, "apply by card");//bardasht
					blank.ctr++;
					fseek(ptr, sizeof(struct Card)*(CardNo - 999), SEEK_SET);
					fwrite(&blank, sizeof(struct Card), 1, ptr);
					fclose(ptr);
					printf("\t\tShift proccess was successfully done.\n\n");
					printf("\t\toffset CardNo:\t%d\n\t\tdestination CardNo:\t%d\n\t\tchange money:\t%lld\n", CardNo, CardNo2, changemoney);
					Sleep(2000);
					puts("\n\n\t\tPress any key to return to previous menu..");
					getch();
					Sleep(500);
					system("cls");
					mainmenu2(CardNo);
				}
				else if (confirm == 'N')//confirm=NO
				{
					system("cls");
					printf("\n\t\tThe proccess cancled.\n");
					puts("\n\n\t\tPress any key to return to previous menu");
					getch();
					Sleep(500);
					system("cls");
					mainmenu2(CardNo);
				}//taeed nashod
			}//na N na Y
		}//mblagh baraye variz ok
	}//if karte maghasd  peyda shod
	else
	{
		printf("\n\t\tSorry..There isn't any account with %d CardNo.\n", CardNo2);
		Sleep(500);
		puts("\n\n\t\tPress any key to return to previous menu");
		getch();
		Sleep(500);
		system("cls");
		mainmenu2(CardNo);
	}//shoamre kart nist
}//card to card

void RecentActiviteis(int CardNo)
{
	FILE *ptr = fopen("project.txt", "r+");
	int number, i, j = 0;
	printf("\n\t\tPlease enter the number of transaction:\t");
	scanf("%d", &number);
	system("cls");
	fseek(ptr, (CardNo - 999)*sizeof(struct Card), SEEK_SET);
	fread(&blank, sizeof(struct Card), 1, ptr);
	if (blank.ctr == 0)
	{
		system("cls");
		puts("\n\t\tSorry..You don't have any transaction:(");
		Sleep(500);
		puts("\n\n\t\tPress any key to return to previous menu.");
		getch();
		Sleep(500);
		system("cls");
		mainmenu2(CardNo);
	}
	else if (blank.ctr >= number)
	{
		printf("Date\t\t\t\tMoney\t\ttype\n\n");
		for (i = blank.ctr - 1; j<number && i >= 0; i--, j++)
		{
			printf("%s\t\t\t\t", blank.date1[i].date);
			printf("%lld\t\t", blank.date1[i].money);
			printf("%s\n\n", blank.date1[i].type);
		}//for
		Sleep(500);
		printf("\nHere,you can see your report.\n");
		Sleep(500);
		puts("\n\nPress any key to return to previous menu.");
		getch();
		Sleep(500);
		system("cls");
		mainmenu2(CardNo);
	}
	else if (blank.ctr<number)
	{
		printf("\n\t\tSorry..You have done only %d transaction.\n", blank.ctr);
		Sleep(500);
		printf("Date\t\t\t\tMoney\t\ttype\n\n");
		for (i = blank.ctr - 1; i >= 0; i--)
		{
			printf("%s\t\t\t\t", blank.date1[i].date);
			printf("%lld\t\t", blank.date1[i].money);
			printf("%s\n\n", blank.date1[i].type);

		}//for
		Sleep(500);
		printf("\nHere,you can see your report.\n");
		Sleep(500);
		puts("\n\nPress any key to return to previous menu");
		getch();
		Sleep(500);
		system("cls");
		mainmenu2(CardNo);
	}
	fclose(ptr);
}//end of transaction

void checkaccount()
{
	FILE *ptr;
	ptr = fopen("project.txt", "r+");
	int flag = 0, CardNovoroodi, Passvoroodi, counter;
	printf("\n\t\tPlease enter your CardNo(4 digits):\t");
	scanf("%d", &CardNovoroodi);
	fseek(ptr, (CardNovoroodi - 999)*sizeof(struct Card), SEEK_SET);
	fread(&blank, sizeof(struct Card), 1, ptr);

	if (blank.CardNo != 0)
		flag++;

	if (flag == 0)
	{
		Sleep(1000);
		printf("\n\t\tSorry,There isn't any Account with cardno %d.\n", CardNovoroodi);
		delay(1000);
		printf("\n\t\tPlease press any key to return to previous menu.\n");
		getch();
		Sleep(500);
		system("cls");
		mainmenu1();
	}

	else//shomare kart peyda shode
	{
		printf("\n\t\tPlease enter your Password(2 digits):\t");
		scanf("%d", &Passvoroodi);
		fseek(ptr, sizeof(struct Card)*(CardNovoroodi - 999), SEEK_SET);
		fread(&blank, sizeof(struct Card), 1, ptr);

		if (Passvoroodi != blank.Pass)
		{
			for (counter = 0; counter<2; counter++)
			{
				system("cls");
				printf("\n\n\t\tWrong Pass.You have only %d chance.please try again and enter your Pass:\t", 2 - counter);
				scanf("%d", &Passvoroodi);
				if (Passvoroodi == blank.Pass)//pass sahih
					break;
				else
					continue;
			}//for:baresiye pass haye motavali
			system("cls");
			if (counter == 2)
			{
				printf("\n\n\t\tSorry,You don't have any more chance...We got your card\n");
				delay(1000);
				printf("\n\t\tPlease press any key to return to previous menu.\t");
				getch();
				Sleep(500);
				system("cls");
				mainmenu1();
			}// counter==2//zabte kart
			//else
		}//if ramze ghalat
		fclose(ptr);
	}//shomareye kart mojood ast//pass dorst ast.
	system("cls");
	mainmenu2(CardNovoroodi);
}

