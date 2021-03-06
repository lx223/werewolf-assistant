package lx223.werewolf.model

import android.os.Parcel
import android.os.Parcelable

data class RoomInfo(val roomId: String, val userId: String) : Parcelable {

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeString(roomId)
        parcel.writeString(userId)
    }

    override fun describeContents(): Int {
        return 0
    }

    companion object CREATOR : Parcelable.Creator<RoomInfo> {
        override fun createFromParcel(parcel: Parcel): RoomInfo {
            return RoomInfo(parcel.readString()!!, parcel.readString()!!)
        }

        override fun newArray(size: Int): Array<RoomInfo?> {
            return arrayOfNulls(size)
        }
    }
}