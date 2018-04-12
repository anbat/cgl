#include<stdio.h>
void roundrobin(int,int,int[],int[]);
void srtf();
main()
{
    int n,tq,choice;
    int done=0;
    int bt[10],st[10],i,j,k;
    while(done==0)
    {    printf("\n1.Round Robin 2.SRT 3.Exit");
        printf("\nEnter Choice:");
        scanf("%d",&choice);
        switch(choice)
        {
            case 1:
                printf("\nRound Robin Scheduling Algorithm");
                printf("\nEnter the number of processes:");
                scanf("%d",&n);
                printf("\nEnter the burst time for Sequences:");
                for(i=0;i<n;i++)
                {
                    scanf("%d",&bt[i]);
                    st[i]=bt[i];
                }
                printf("\nEnter the time quantum:");
                scanf("%d",&tq);
                roundrobin(n,tq,st,bt);
                break;
            case 2:
                printf("\n-------------SHORTEST REMAINING TIME NEXT----------------");
                
                srtf();
                break;
            case 3:
                done=1;
                break;
        }
    }
}
void roundrobin(int n,int tq,int st[],int bt[])
{
    int time=0;
    int tat[10],wt[10],i,count=0,swt=0,stat=0,temp1,sq=0,j,k;
    float awt=0.0,atat=0.0;
    while(1)
    {
        for(i=0,count=0;i<n;i++)
        {
            temp1=tq;
            if(st[i]==0)
            {
                count++;
                continue;
            }
            if(st[i]>tq)
                st[i]=st[i]-tq;
            else
                if(st[i]>=0)
                {
                    temp1 = st[i];
                    st[i] = 0;
                }
                sq = sq+temp1;
                tat[i] = sq;
        }
        if(n==count)
            break;
    }
    for(i=0;i<n;i++)
    {
        wt[i] = tat[i]-bt[i];
        swt = swt+wt[i];
        stat = stat+tat[i];
    }
    awt = (float) swt/n;
    atat = (float) stat/n;
    printf("\nProcessNumber\t\tBurstTime\t\tWaitTime\t\tTurnaroundTime");
    for(i=0;i<n;i++)
    printf("\n%d\t\t%d\t\t%d\t\t%d\t\t",i+1,bt[i],wt[i],tat[i]);
    printf("\nAverage Wait Time is %f \nAverage Turnaround Time is %f",awt,atat);
}
void srtf()
{
    int n,i,j=0,at[10],bt[10],rt[10],remain=0,smallest,time=0,endtime,swt=0,stat=0;
    printf("\nEnter the number of processes:");
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        printf("\nEnter the arrival time for P[%d]:",i+1);
        scanf("%d",&at[i]);
        printf("\nEnter the burst time for P[%d]:",i+1);
        scanf("%d",&bt[i]);
        rt[i]=bt[i];
    }
    rt[9]=9999;
    printf("\nProcess\t\tWaiting Time\t\tTurnAroundTime");
    for(time=0;remain!=n;time++)
    {
        smallest=9;
        for(i=0;i<n;i++)
        {
            if(at[i]<=time && rt[i]<rt[smallest] && rt[i]>0)
            {
                smallest = i;
            }
        }
        rt[smallest]--;
        if(rt[smallest]==0)
        {
            remain++;
            endtime = time+1;
            j=smallest;
            printf("\nP[%d]\t\t%d\t|\t%d\n",smallest+1,endtime-bt[j]-at[j],endtime-at[j]);
            swt+=endtime-bt[j]-at[j];
            stat+=endtime-at[j];
        }
    }
    float awt=0,atat=0;
    awt =  (float)swt/n;
    atat = (float)stat/n;
    printf("\nAverage Waiting time: %f",awt);
    printf("\nAver tat: %f",atat);

                
}

