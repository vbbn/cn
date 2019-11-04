#include <bits/stdc++.h>
using namespace std;

const int m = 100; //max no. of routers

void floyd_algo(int graph[][m], int n)
{
    for (int k = 0; k < n; k++)
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
                graph[i][j] = min(graph[i][j], (graph[i][k] + graph[k][j]));
}

int main()
{

    int n, router, graph[m][m];

    cout << "enter no. of nodes : ";
    cin >> n;

    cout << "enter the cost matrix (If there is no path enter a very large number within the range of integer value):\n";

    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            cin >> graph[i][j];

    cout << "enter the root/router node index : ";
    cin >> router;

    floyd_algo(graph, n);

    for (int i = 0; i < n; i++)
        cout << "shortest distance from " << router << " to " << i << " is " << graph[router][i] << endl;

    cout << "\n\nnew cost matrix :\n";

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++)
            cout << graph[i][j] << " ";
        cout << endl;
    }

    return 0;
}

