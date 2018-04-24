#include "player.h"
#include <QDebug>

Player::Player(QObject *parent) : QObject(parent)
{
    connect(&m_player, SIGNAL(positionChanged(qint64)), this, SLOT(positionChanged(qint64)));
    connect(&m_player, SIGNAL(durationChanged(qint64)), this, SLOT(durationChanged(qint64)));
}

void Player::playSL(QString path)
{
    qDebug() << path;
    m_player.setMedia(QUrl::fromLocalFile("f:\\music\\bigbang-if you.mp3"));
    m_player.setVolume(30);
    m_player.play();
}

void Player::positionChanged(qint64 milliseconds)
{
    int sec = milliseconds/1000;
    qDebug() << sec/60<< ":" << sec%60;
}

void Player::durationChanged(qint64 milliseconds)
{
    m_currentTotalTime = milliseconds/1000;
    qDebug() << "TotalTime: " << m_currentTotalTime/60 << m_currentTotalTime%60;
}


//QString PinYinHelper::getChineseSpell(QString& src)
//{
//    unsigned char ucHigh, ucLow;
//    int  nCode;
//    QString strPinYin;
//    for (int i=0; i<src.length(); i++)
//    {
//        ucHigh = src[i].unicode();
//        if (ucHigh < 0x80 )//英文字母
//        {
//            strPinYin.append(src[i]);
//            continue;
//        }
//        ucLow  = src[i + 1].unicode();
//        if ( ucHigh < 0xa1 || ucLow < 0xa1)
//        {
//            continue;
//        }
//        else
//        {
//            nCode = (ucHigh - 0xa0) * 100 + ucLow - 0xa0;
//        }
//        strPinYin.append(FirstLetter(nCode));
//        i++;
//    }
//    return strPinYin;
//}

//QString PinYinHelper::FirstLetter(int nCode)
//{
//    if(nCode >= 1601 && nCode < 1637) return "A";
//    if(nCode >= 1637 && nCode < 1833) return "B";
//    if(nCode >= 1833 && nCode < 2078) return "C";
//    if(nCode >= 2078 && nCode < 2274) return "D";
//    if(nCode >= 2274 && nCode < 2302) return "E";
//    if(nCode >= 2302 && nCode < 2433) return "F";
//    if(nCode >= 2433 && nCode < 2594) return "G";
//    if(nCode >= 2594 && nCode < 2787) return "H";
//    if(nCode >= 2787 && nCode < 3106) return "J";
//    if(nCode >= 3106 && nCode < 3212) return "K";
//    if(nCode >= 3212 && nCode < 3472) return "L";
//    if(nCode >= 3472 && nCode < 3635) return "M";
//    if(nCode >= 3635 && nCode < 3722) return "N";
//    if(nCode >= 3722 && nCode < 3730) return "O";
//    if(nCode >= 3730 && nCode < 3858) return "P";
//    if(nCode >= 3858 && nCode < 4027) return "Q";
//    if(nCode >= 4027 && nCode < 4086) return "R";
//    if(nCode >= 4086 && nCode < 4390) return "S";
//    if(nCode >= 4390 && nCode < 4558) return "T";
//    if(nCode >= 4558 && nCode < 4684) return "W";
//    if(nCode >= 4684 && nCode < 4925) return "X";
//    if(nCode >= 4925 && nCode < 5249) return "Y";
//    if(nCode >= 5249 && nCode < 5590) return "Z";
//    return "";
//}
